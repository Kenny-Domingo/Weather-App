//
//  Day1ViewController.swift
//  Weather App
//
//  Created by Kenny Domingo on 03/05/2017.
//  Copyright © 2017 Kenny Domingo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Day1ViewController: UIViewController, IndicatorInfoProvider {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    let defaults = UserDefaults.standard
    
    var weather = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defaults.set("Monday", forKey: "day")
        
        weather.downloadData {
            self.updateUI()
        }
    }
    
    func updateUI() {
        dateLabel.text = "Monday \(weather.date)"
        tempLabel.text = "\(weather.temp)"
        minTempLabel.text = "\(weather.minTemp) \nMin"
        maxTempLabel.text = "\(weather.maxTemp) \nMax"
        locationLabel.text = weather.location
        
        if weather.weather == "Rain"{
            weatherLabel.text = "\(weather.weather) \n\nUmbrella needed ☔️"
        }else if weather.weather == "Clear"{
            weatherLabel.text = "\(weather.weather) \n\nSunglasses out 😎"
        }else{
            weatherLabel.text = weather.weather
        }
        
        weatherImage.image = UIImage(named: weather.weather)
        let img = weather.weatherCondition(weatherCon: weather.weatherCon)
        weather.getImage(img, weatherImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo{
        
        return IndicatorInfo(title: " Monday ")
    }

}
