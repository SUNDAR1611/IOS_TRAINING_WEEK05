//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by cs_ios on 14/08/25.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            
            ContentView(viewModel: WeatherViewModel(service: RealWeatherService()))
        }
    }
}
