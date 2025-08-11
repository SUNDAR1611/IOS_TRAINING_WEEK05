//
//  CounterViewModel.swift
//  Day01-unit-testing
//
//  Created by cs_ios on 11/08/25.
//

import Foundation

class CounterViewModel: ObservableObject {
    @Published private(set) var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func reset() {
        count = 0
    }
}
