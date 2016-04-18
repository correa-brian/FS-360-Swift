//
//  DDLocation.swift
//  DemographicData
//
//  Created by Brian Correa on 4/17/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

//class CurrencyFormatter {
//    
//    var price = 100
//    
//    var formatter = NSNumberFormatter()
//    var formattedPrice: String!
//    
//    init() {
//        
//        formatter.numberStyle = .CurrencyStyle
//        formatter.locale = NSLocale.currentLocale() // This is the default
//        self.formattedPrice = formatter.stringFromNumber(price)
//    }
//}

class DDLocation: NSObject {
    
    //MARK: Properties
    
    //location
    var lat: Double!
    var lng: Double!
    
    //income info
    var medianIncome: Int!
    var incomeLessthan25: Double!
    var income25to50: Double!
    var income50to100: Double!
    var income100to200: Double!
    var incomeGreater200: Double!
    var formattedIncome: String!
    
    //education info
    var hsGrad: Double!
    var bachGrad: Double!
    

//    let formatter = CurrencyFormatter()
//    self.formattedIncome = formatter.formattedPrice
//    
////    let price = 123.436
////    
////    let formatter = NSNumberFormatter()
////    formatter.numberStyle = .CurrencyStyle
//
////    formatter.stringFromNumber(price) // "$123.44"
//
////    formatter.locale = NSLocale(localeIdentifier: "es_CL")
////    formatter.stringFromNumber(price) // $123"
    
    //MARK: Parsing Function
    
    func populate(info: Dictionary<String, AnyObject>){
        if let m = info["medianIncome"] as? Int {
            self.medianIncome = m
//            print("\(m)")
        }
        if let inLess25 = info["incomeLessThan25"] as? Double {
            self.incomeLessthan25 = inLess25
//            print("\(inLess25)")
        }
        
        if let in25to50 = info["incomeBetween25to50"] as? Double {
            self.income25to50 = in25to50
//            print("\(income25to50)")
        }
        
        
        if let in50to100 = info["incomeBetween50to100"] as? Double {
            self.income50to100 = in50to100
//            print("\(in50to100)")
        }
        
        
        if let in100to200 = info["incomeBetween100to200"] as? Double {
            self.income100to200 = in100to200
//            print("\(in100to200)")
        }
        
        
        if let inGreater200 = info["incomeGreater200"] as? Double {
            self.incomeGreater200 = inGreater200
//            print("\(inGreater200)")
        }
        
        if let h = info["educationHighSchoolGraduate"] as? Double {
            self.hsGrad = h
//            print("\(h)")
        }
        
        if let b = info["educationBachelorOrGreater"] as? Double {
            self.bachGrad = b
//            print("\(b)")
        }
        
    }
    
}
