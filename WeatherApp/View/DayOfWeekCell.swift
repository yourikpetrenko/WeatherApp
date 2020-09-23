//
//  dayOfWeelCell.swift
//  WeatherApp
//
//  Created by Jura on 22.09.2020.
//

import UIKit

class DayOfWeekCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var tempCell: UILabel!
    @IBOutlet weak var dayCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
