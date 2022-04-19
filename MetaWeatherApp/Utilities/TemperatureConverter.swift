//
//  TemperatureConverter.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 19/04/2022.
//

import Foundation
class TemperatureConverter {
    static func toFahrenheit(celsius: Double) -> Double {
        let fahrenheitTemperature = celsius * 9 / 5 + 32
        return fahrenheitTemperature
  }
    static func toCelsius(fahrenheit: Double) -> Double {
        let celsiusTemperature = 5.0 / 9.0 * (fahrenheit - 32.0)
        return celsiusTemperature
    }
}
