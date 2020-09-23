//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jura on 22.09.2020.
//

import Foundation

struct WeatherModel: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
