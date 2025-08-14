//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by cs_ios on 14/08/25.
//

import XCTest
@testable import WeatherApp

final class WeatherViewModelTests: XCTestCase {

   
    final class MockWeatherService: WeatherService {
        var weatherToReturn: String = "Sunny"
        func fetchWeather(for city: String) -> String {
            return weatherToReturn
        }
    }

    func test_updateMessage_usesServiceResult() {
        // Arrange
        let mock = MockWeatherService()
        mock.weatherToReturn = "Rainy"
        let sut = WeatherViewModel(service: mock)

        // Act
        sut.updateMessage(for: "Chennai")

        // Assert
        XCTAssertEqual(sut.message, "The weather in Chennai is Rainy.")
    }

    func test_updateMessage_emptyCityShowsValidationMessage() {
        // Arrange
        let mock = MockWeatherService()
        let sut = WeatherViewModel(service: mock)

        // Act
        sut.updateMessage(for: "   ")

        // Assert
        XCTAssertEqual(sut.message, "Please enter a valid city.")
    }

    func test_updateMessage_trimsWhitespace() {
        // Arrange
        let mock = MockWeatherService()
        mock.weatherToReturn = "Clear"
        let sut = WeatherViewModel(service: mock)

        // Act
        sut.updateMessage(for: "  Delhi  ")

        // Assert
        XCTAssertEqual(sut.message, "The weather in Delhi is Clear.")
    }
}
