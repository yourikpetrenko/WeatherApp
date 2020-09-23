//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Jura on 22.09.2020.
//

import Foundation

// MARK: - Network Service, for getting data
protocol NetworkServiceProtocol {
    func getData(completion: @escaping ((MainWeatherModel) -> Void))
}

class NetworkManager: NetworkServiceProtocol {
    func getData(completion: @escaping ((MainWeatherModel) -> Void)) {
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=45.03&lon=41.97&exclude=minutely,hourly,alerts&units=metric&lang=ru&appid=aba97f0f9cb4a2d9d813f61d8784e70d"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                var weatherData: MainWeatherModel
                weatherData = try JSONDecoder().decode(MainWeatherModel.self, from: data)
                completion(weatherData)
            } catch let error{
                print(error)
            }
        }.resume()
    }
}
