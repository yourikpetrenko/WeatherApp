//
//  Daily.swift
//  WeatherApp
//
//  Created by Jura on 23.09.2020.
//

import Foundation

struct Daily: Codable {
    var temp: DailyTemp
    var weather: [IconModel]
}
