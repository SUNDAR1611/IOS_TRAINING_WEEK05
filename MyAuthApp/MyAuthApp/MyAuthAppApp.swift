//
//  MyAuthAppApp.swift
//  MyAuthApp
//
//  Created by cs_ios on 16/08/25.
//

import SwiftUI
import Firebase

@main
struct MyAuthApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
