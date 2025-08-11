//
//  ContentView.swift
//  Day01-unit-testing
//
//  Created by cs_ios on 11/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)
            
            Button("Increment") {
                viewModel.increment()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Reset") {
                viewModel.reset()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
