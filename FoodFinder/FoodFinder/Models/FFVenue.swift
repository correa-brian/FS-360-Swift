//
//  FFVenue.swift
//  FoodFinder
//
//  Created by Brian Correa on 4/12/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class FFVenue: NSObject {
    
    var name: String!
    var address: String!
    var rating: Float!
    
    func populate(info: Dictionary<String, AnyObject>){
        if let n = info["name"] as? String {
            self.name = n
        }
        
        if let a = info["vicinity"] as? String {
            self.address = a
        }
        
        if let r = info["rating"] as? Float {
            self.rating = r
        }
        
    }

}
