//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jura on 22.09.2020.
//

import Foundation

// MARK: - Main model, for getting JSON
struct MainWeatherModel: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var current: CurrentWeatherModel
    var daily: [Daily]
}
