//
//  ParentViewController.swift
//  Weather App
//
//  Created by Kenny Domingo on 03/05/2017.
//  Copyright © 2017 Kenny Domingo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {
    
    let defaults = UserDefaults.standard
    
    let purpleInspireColor = UIColor(red:255.0, green:255.0, blue:255.0, alpha:1.0)
    
    override func viewDidLoad() {
        
        menuBarSetup()
        
        super.viewDidLoad()
        
        menuBarSetup1()
    }
    
    
    func menuBarSetup(){
        
        settings.style.selectedBarHeight = 5
        settings.style.selectedBarBackgroundColor = .purple
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
    }
    
    func menuBarSetup1(){
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .black
        settings.style.buttonBarItemBackgroundColor = .black
        //settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = .systemFont(ofSize: 17)
        //settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        //settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 5
        settings.style.buttonBarRightContentInset = 5
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = self?.purpleInspireColor
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day1")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day2")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day3")
        let child_4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day4")
        let child_5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day5")
        let child_6 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day6")
        let child_7 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Day7")
        
        let dayTitle = defaults.string(forKey: "day")
        
        switch dayTitle {
        case "Monday"?:
            return [child_1, child_2, child_3, child_4, child_5]
            
        case "Tuesday"?:
            return [child_2, child_3, child_4, child_5, child_6]
                
        case "Wednesday"?:
            return [child_3, child_4, child_5, child_6, child_7]
                
        case "Thursday"?:
            return [child_4, child_5, child_6, child_7, child_1]
                
        case "Friday"?:
            return [child_5, child_6, child_7, child_1, child_2]
                
        case "Saturday"?:
            return [child_6, child_7, child_1, child_2, child_3]
                
        case "Sunday"?:
            return [child_7, child_1, child_2, child_3, child_4]
            
        default:
            return [child_1, child_2, child_3, child_4, child_5]
            
        }
    }

}
