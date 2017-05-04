//
//  DataModel.swift
//  Weather App
//
//  Created by Kenny Domingo on 03/05/2017.
//  Copyright © 2017 Kenny Domingo. All rights reserved.
//

import Foundation
import Alamofire


class DataModel {
    
    private var _date: Double?
    private var _day: Double?
    private var _temp: String?
    private var _maxTemp: String?
    private var _minTemp: String?
    private var _location: String?
    private var _weather: String?
    private var _weatherCon: String?
    typealias JSONStandard = Dictionary<String, AnyObject>
    
    var dayCases = SwitchCases()
    
    let defaults = UserDefaults.standard
    
    let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast/daily?id=2643743&appid=9ab980154b2797d68656609717cbb4e6")!
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        //dateFormatter.dateFormat = "EEEE"
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? " \(dateFormatter.string(from: date))" : "Date Invalid"
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "EEEE"
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? "\(dateFormatter.string(from: date))" : "Day Invalid"
    }
 
    func downloadData(completed: @escaping ()-> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            print(result.value as Any)
            
            //Get day index
            let dayTitle = self.defaults.string(forKey: "day")
            
            if let dayName = dayTitle{
                
            let index = Int(self.dayCases.updateDay(day: dayName))
            
                if let dict1 = result.value as? JSONStandard{
                    let city:String! = (dict1["city"] as? NSDictionary)?["name"] as! String
                    let country:String! = (dict1["city"] as? NSDictionary)?["country"] as! String
                    
                    self._location = "\(city!), \(country!)"
                    
                        if let list = dict1["list"]! as? [AnyObject]{
                            
                            let temp = (list[index!]["temp"] as? NSDictionary)?["day"] as? Double
                            let minTemp = (list[index!]["temp"] as? NSDictionary)?["min"] as? Double
                            let maxTemp = (list[index!]["temp"] as? NSDictionary)?["max"] as? Double
                        
                            self._temp = String(format: "%.0f °C", temp! - 273.15)
                            self._minTemp = String(format: "%.0f °C", minTemp! - 273.15)
                            self._maxTemp = String(format: "%.0f °C", maxTemp! - 273.15)
                        
                            let weatherArray = list[index!]["weather"] as? [JSONStandard]
                            let weather = weatherArray?[0]["main"] as? String
                            let weatherCon = weatherArray?[0]["icon"] as? String
                            
                            self._weather = weather
                            self._weatherCon = weatherCon
                        
                            let dt = list[index!]["dt"] as? Double
                            
                            self._date = dt
                            self._day = dt
                            
                        }
                    
                }
            }else{
                if let dict1 = result.value as? JSONStandard{
                    let city:String! = (dict1["city"] as? NSDictionary)?["name"] as! String
                    let country:String! = (dict1["city"] as? NSDictionary)?["country"] as! String
                    
                    self._location = "\(city!), \(country!)"
                    
                    if let list = dict1["list"]! as? [AnyObject]{
                        
                        let temp = (list[0]["temp"] as? NSDictionary)?["day"] as? Double
                        let minTemp = (list[0]["temp"] as? NSDictionary)?["min"] as? Double
                        let maxTemp = (list[0]["temp"] as? NSDictionary)?["max"] as? Double
                        
                        self._temp = String(format: "%.0f °C", temp! - 273.15)
                        self._minTemp = String(format: "%.0f °C", minTemp! - 273.15)
                        self._maxTemp = String(format: "%.0f °C", maxTemp! - 273.15)
                        
                        let weatherArray = list[0]["weather"] as? [JSONStandard]
                        let weather = weatherArray?[0]["main"] as? String
                        let weatherCon = weatherArray?[0]["icon"] as? String
                        
                        self._weather = weather
                        self._weatherCon = weatherCon
                        
                        let dt = list[0]["dt"] as? Double
                        
                        self._date = dt
                        self._day = dt
                        
                    }
                    
                }

            }
            
            completed()
        })
    }
    
    func weatherCondition(weatherCon: String) -> String{
        
        let weatherCond = weatherCon
        
        return "http://openweathermap.org/img/w/\(weatherCond).png"
    }
    
    func getImage(_ url_str:String, _ imageView:UIImageView){
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if data != nil{
                let image = UIImage(data: data!)
                if(image != nil){
                    DispatchQueue.main.async(execute: {
                        imageView.image = image
                    })
                }
            }
        })
        task.resume()
        
    }

    
    var temp: String {
        return _temp ?? "0 °C"
    }
    
    var minTemp: String {
        return _minTemp ?? "0 °C"
    }
    
    var maxTemp: String {
        return _maxTemp ?? "0 °C"
    }
    
    var location: String {
        return _location ?? "Location Invalid"
    }
    
    var weather: String {
        return _weather ?? "Weather Invalid"
    }
    
    var weatherCon: String {
        return _weatherCon ?? "Weather Invalid"
    }
    
}
