//
//  EmployeeWebView.swift
//  employeemanagement
//
//  Created by cs_ios on 15/08/25.
//

import SwiftUI
import WebKit

struct EmployeeWebView: UIViewRepresentable {
    let htmlFileName: String
    let onFormSubmit: (String, String, String, String) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onFormSubmit: onFormSubmit)
    }

    func makeUIView(context: Context) -> WKWebView {
        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "employeeForm")

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        let webView = WKWebView(frame: .zero, configuration: config)

        if let url = Bundle.main.url(forResource: htmlFileName, withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    class Coordinator: NSObject, WKScriptMessageHandler {
        var onFormSubmit: (String, String, String, String) -> Void

        init(onFormSubmit: @escaping (String, String, String, String) -> Void) {
            self.onFormSubmit = onFormSubmit
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard message.name == "employeeForm",
                  let dict = message.body as? [String: String] else { return }

            let name = dict["name"] ?? ""
            let id = dict["id"] ?? ""
            let dept = dict["dept"] ?? ""
            let age = dict["age"] ?? ""
            onFormSubmit(name, id, dept, age)
        }
    }
}
