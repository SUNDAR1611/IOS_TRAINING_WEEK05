//
//  ContentView.swift
//  webHTML
//
//  Created by cs_ios on 13/08/25.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            
           
            WebView(htmlFileName: "contact") { name, email, message in
                print("Name: \(name)")
                print("Email: \(email)")
                print("Message: \(message)")
            }
            .tabItem {
                Image(systemName: "envelope")
                Text("Contact")
            }
            .tag(0)

           
            SimpleWebView(urlString: "https://www.google.com")
                           .tabItem {
                               Image(systemName: "globe")
                               Text("Search")
                           }
                           .tag(1)


            
            SimpleWebView(urlString: "https://www.hindustantimes.com/sports")
                           .tabItem {
                               Image(systemName: "sportscourt")
                               Text("Sports")
                           }
                           .tag(2)
        }
    }
}

#Preview {
    ContentView()
}

