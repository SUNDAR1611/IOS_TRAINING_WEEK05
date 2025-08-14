//
//  BrowserWebView.swift
//  web_view
//
//  Created by cs_ios on 14/08/25.
//

import SwiftUI
import WebKit

struct BrowserWebView: UIViewRepresentable {
    @Binding var urlString: String
    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString), uiView.url != url {
            uiView.load(URLRequest(url: url))
        }
    }
}
