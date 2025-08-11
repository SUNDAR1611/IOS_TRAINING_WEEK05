//
//  TodoViewModel.swift
//  UnitTestingDemo
//
//  Created by cs_ios on 11/08/25.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var tasks: [TodoTask] = [
        TodoTask(name: "Grocery shopping"),
        TodoTask(name: "Take pet on a walk"),
        TodoTask(name: "Work on SwiftUI app"),
    ]

    func addTask(name: String) {
        guard !name.isEmpty else { return }
        let newTodoTask = TodoTask(name: name)
        tasks.append(newTodoTask)
    }
    
}
