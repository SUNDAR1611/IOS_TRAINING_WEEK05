//
//  ContentView.swift
//  MyAuthApp
//
//  Created by cs_ios on 16/08/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            if isLoggedIn {
                NotesView(onLogout: {
                    isLoggedIn = false
                    email = ""
                    password = ""
                    message = ""
                })
            } else {
                LinearGradient(colors: [.black, .red.opacity(0.9)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 25) {
                    Text("B00k AUTH")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.red)

                    TextField("Enter Email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .autocapitalization(.none)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 1))

                    SecureField("Enter Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 1))

                    Button(action: signUp) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.red, .black],
                                                       startPoint: .leading,
                                                       endPoint: .trailing))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .bold()
                            .shadow(radius: 5)
                    }

                    Button(action: login) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.black, .red],
                                                       startPoint: .leading,
                                                       endPoint: .trailing))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .bold()
                            .shadow(radius: 5)
                    }

                    Text(message)
                        .foregroundColor(.yellow)
                        .bold()
                        .padding(.top, 10)
                }
                .padding(30)
            }
        }
    }

    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                message = "Sign Up Error: \(error.localizedDescription)"
            } else {
                message = " User created: \(result?.user.email ?? "")"
                isLoggedIn = true
            }
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                message = "Login Error: \(error.localizedDescription)"
            } else {
                message = "Logged in as: \(result?.user.email ?? "")"
                isLoggedIn = true
            }
        }
    }
}

struct NotesView: View {
    @State private var notes: [String] = []
    @State private var newNote = ""
    var onLogout: () -> Void

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    List(notes, id: \.self) { note in
                        Text(note)
                            .foregroundColor(.white)
                    }
                    .scrollContentBackground(.hidden)

                    HStack {
                        TextField("Enter a note...", text: $newNote)
                            .padding()
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(8)
                            .foregroundColor(.white)

                        Button("Add") {
                            if !newNote.isEmpty {
                                notes.append(newNote)
                                newNote = ""
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .navigationTitle("My Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Logout") {
                    try? Auth.auth().signOut()
                    onLogout()
                }
                .foregroundColor(.red)
            }
        }
    }
}
