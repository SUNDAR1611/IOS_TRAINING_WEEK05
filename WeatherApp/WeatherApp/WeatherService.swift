//
//  WeatherService.swift
//  WeatherApp
//
//  Created by cs_ios on 14/08/25.
//

import Foundation

protocol WeatherService {
    
    func fetchWeather(for city: String) -> String
}

final class RealWeatherService: WeatherService {
    func fetchWeather(for city: String) -> String {
       
        let options = ["Sunny", "Cloudy", "Rainy", "Windy", "Humid", "Clear"]
        let index = abs(city.lowercased().hashValue) % options.count
        return options[index]
    }
}
