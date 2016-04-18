//
//  FFVenue.swift
//  FoodFinder
//
//  Created by Brian Correa on 4/12/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import MapKit

class FFVenue: NSObject, MKAnnotation {
    
    //MARK: Properties
    
    var name: String!
    var address = ""
    var rating: Double!
    var phone = ""
    var lng: Double!
    var lat: Double!
    
    //MARK: - Required protocol methods for MK Annotation
    var title: String? { //gets displayed on the pin
        return self.name
    }
    
    var subtitle: String? { //gets displayed on the pin
        return self.address
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.lat, self.lng)
    }
    
    //MARK: - Parsing Function
    
    func populate(info: Dictionary<String, AnyObject>){
        if let n = info["name"] as? String {
            self.name = n
        }
        
        if let a = info["vicinity"] as? String {
            self.address = a
        }
        
        if let location = info["location"] as? Dictionary<String, AnyObject> {
//            print("LOCATION: \(location)")
            
            if let addr = location["address"] as? String {
                self.address = addr
            }
            if let lng = location["lng"] as? Double {
                self.lng = lng
            }
            if let lat = location["lat"] as? Double {
                self.lat = lat
            }
        }
        
        if let contact = info["contact"] as? Dictionary<String, AnyObject> {
//            print("CONTACT: \(contact)")
            if let formattedPhone = contact["formattedPhone"] as? String {
//                print("PHONE: \(phone)")
                self.phone = formattedPhone
            }
        }
        
        if let r = info["rating"] as? Double {
            self.rating = r
        }
        
    }

}
