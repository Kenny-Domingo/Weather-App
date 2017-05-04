//
//  SwitchCases.swift
//  Weather App
//
//  Created by Kenny Domingo on 04/05/2017.
//  Copyright © 2017 Kenny Domingo. All rights reserved.
//

import Foundation


class SwitchCases {

    
    let defaults = UserDefaults.standard
    
    func updateDay(day: String) -> String {
        
        let dayCase:String = self.defaults.string(forKey: "case")!
        let dayTitle = day
        
        switch dayCase {
        case "Monday":
            return mondayCase(day: dayTitle)
            
        case "Tuesday":
            return tuesdayCase(day: dayTitle)
            
        case "Wednesday":
            return wednesdayCase(day: dayTitle)
            
        case "Thursday":
            return thursdayCase(day: dayTitle)
            
        case "Friday":
            return fridayCase(day: dayTitle)
            
        case "Saturday":
            return saturdayCase(day: dayTitle)
            
        case "Sunday":
            return sundayCase(day: dayTitle)
            
        default:
            
            return mondayCase(day: dayTitle)
            
        }
    }

    func mondayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "0"
            
        case "Tuesday":
            return "1"
            
        case "Wednesday":
            return "2"
            
        case "Thursday":
            return "3"
            
        case "Friday":
            return "4"
            
        case "Saturday":
            return "5"
            
        case "Sunday":
            return "6"
            
        default:
            return "0"
            
        }
        
        
    }

    func tuesdayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "6"
            
        case "Tuesday":
            return "0"
            
        case "Wednesday":
            return "1"
            
        case "Thursday":
            return "2"
            
        case "Friday":
            return "3"
            
        case "Saturday":
            return "4"
            
        case "Sunday":
            return "5"
            
        default:
            return "0"
            
        }
        
        
    }
    func wednesdayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "5"
            
        case "Tuesday":
            return "6"
            
        case "Wednesday":
            return "0"
            
        case "Thursday":
            return "1"
            
        case "Friday":
            return "2"
            
        case "Saturday":
            return "3"
            
        case "Sunday":
            return "4"
            
        default:
            return "0"
            
        }
        
        
    }
    func thursdayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "4"
            
        case "Tuesday":
            return "5"
            
        case "Wednesday":
            return "6"
            
        case "Thursday":
            return "0"
            
        case "Friday":
            return "1"
            
        case "Saturday":
            return "2"
            
        case "Sunday":
            return "3"
            
        default:
            return "0"
            
        }
        
        
    }
    func fridayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "3"
            
        case "Tuesday":
            return "4"
            
        case "Wednesday":
            return "5"
            
        case "Thursday":
            return "6"
            
        case "Friday":
            return "0"
            
        case "Saturday":
            return "1"
            
        case "Sunday":
            return "2"
            
        default:
            return "0"
            
        }
        
        
    }
    func saturdayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "2"
            
        case "Tuesday":
            return "3"
            
        case "Wednesday":
            return "4"
            
        case "Thursday":
            return "5"
            
        case "Friday":
            return "6"
            
        case "Saturday":
            return "0"
            
        case "Sunday":
            return "1"
            
        default:
            return "0"
            
        }
        
        
    }
    func sundayCase(day: String) -> String {
        let dayTitle = day
        
        switch dayTitle {
        case "Monday":
            return "1"
            
        case "Tuesday":
            return "2"
            
        case "Wednesday":
            return "3"
            
        case "Thursday":
            return "4"
            
        case "Friday":
            return "5"
            
        case "Saturday":
            return "6"
            
        case "Sunday":
            return "0"
            
        default:
            return "0"
            
        }
        
        
    }

}
