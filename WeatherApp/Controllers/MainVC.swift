//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jura on 22.09.2020.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentImageView: UIImageView!
    
    let networkService: NetworkServiceProtocol = NetworkManager()

    var arrayWeatherData: MainWeatherModel?
    var dayName = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkService.getData { (data) in
            self.arrayWeatherData = data
            DispatchQueue.main.async {
                self.currentTemp.text = String("\(Int(self.arrayWeatherData?.current.temp ?? 0))°C")
                self.currentImageView.image = UIImage(named: self.arrayWeatherData?.current.weather[0].icon ?? "")
                self.tableView.reloadData()
            }
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "DayOfWeekCell", bundle: nil), forCellReuseIdentifier: "DayOfWeekCell")
    }
}


extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayOfWeekCell", for: indexPath) as! DayOfWeekCell
        let dailyArray = arrayWeatherData?.daily[indexPath.row]
        let tempDaily = dailyArray?.temp
        let iconArray = dailyArray?.weather[0].icon
        cell.dayCell.text = dayName[indexPath.row]
        cell.tempCell.text = String("\(Int(tempDaily?.day ?? 0))°C")
        cell.imageCell.image = UIImage(named: iconArray ?? "")
        return cell
    }
}

