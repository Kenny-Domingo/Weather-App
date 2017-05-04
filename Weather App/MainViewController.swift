//
//  MainViewController.swift
//  Weather App
//
//  Created by Kenny Domingo on 04/05/2017.
//  Copyright © 2017 Kenny Domingo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var day = DataModel()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defaults.removeObject(forKey: "day")
        self.defaults.removeObject(forKey: "case")
        
        day.downloadData {
            
            self.defaults.set(self.day.day, forKey: "day")
            self.defaults.set(self.day.day, forKey: "case")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
