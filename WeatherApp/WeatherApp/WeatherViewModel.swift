//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by cs_ios on 14/08/25.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published private(set) var message: String = "Enter a city to see its weather."
    private let service: WeatherService

    init(service: WeatherService) {
        self.service = service
    }

    func updateMessage(for city: String) {
        let trimmed = city.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            message = "Please enter a valid city."
            return
        }

        let weather = service.fetchWeather(for: trimmed)
        message = "The weather in \(trimmed) is \(weather)."
    }
}
