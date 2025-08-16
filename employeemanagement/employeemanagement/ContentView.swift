//
//  ContentView.swift
//  employeemanagement
//
//  Created by cs_ios on 15/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EmployeeWebView(htmlFileName: "employee") { name, id, dept, age in
            print("Employee Name: \(name)")
            print("Employee ID: \(id)")
            print("Department: \(dept)")
            print("Age: \(age)")
        }
    }
}

#Preview {
    ContentView()
}
