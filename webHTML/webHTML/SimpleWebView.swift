//
//  SimpleWebView.swift
//  webHTML
//
//  Created by cs_ios on 13/08/25.
//
import SwiftUI
import WebKit

struct SimpleWebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

