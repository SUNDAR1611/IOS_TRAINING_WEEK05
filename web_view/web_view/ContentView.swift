//
//  ContentView.swift
//  web_view
//
//  Created by cs_ios on 14/08/25.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var urlText: String = "https://www.google.com"
    @State private var webView = WKWebView()

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                TextField("Enter URL or search term", text: $urlText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Button("Go") {
                    loadPage()
                }
                .padding(.horizontal, 8)
            }
            .padding()

            HStack {
                Button(action: {
                    if webView.canGoBack {
                        webView.goBack()
                    }
                }) {
                    Image(systemName: "chevron.backward")
                }
                .padding(.horizontal)

                Button(action: {
                    if webView.canGoForward {
                        webView.goForward()
                    }
                }) {
                    Image(systemName: "chevron.forward")
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 5)

            BrowserWebView(urlString: $urlText, webView: webView)
                .edgesIgnoringSafeArea(.bottom)
        }
    }

    func loadPage() {
        var enteredText = urlText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // If user didn't type "http", treat it as a search term
        if !enteredText.hasPrefix("http") {
            enteredText = "https://www.google.com/search?q=" + enteredText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        
        urlText = enteredText
        if let url = URL(string: enteredText) {
            webView.load(URLRequest(url: url))
        }
    }
}

#Preview {
    ContentView()
}
