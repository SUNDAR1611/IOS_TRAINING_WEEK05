//
//  ContentView.swift
//  WeatherApp
//
//  Created by cs_ios on 14/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = ""
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter a city")) {
                    TextField("City", text: $city)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)

                    Button("Get Weather") {
                        viewModel.updateMessage(for: city)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }

                Section(header: Text("Result")) {
                    Text(viewModel.message)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .minimumScaleFactor(0.8)
                        .lineLimit(3)
                }
            }
            .navigationTitle("Weather Demo")
        }
    }
}

#Preview {
    ContentView(viewModel: WeatherViewModel(service: RealWeatherService()))
}

