//
//  ListModel.swift
//  WeatherApp
//
//  Created by Jura on 22.09.2020.
//

import Foundation

struct CurrentWeatherModel: Codable {
    var temp: Double
    var weather: [WeatherModel]
}
