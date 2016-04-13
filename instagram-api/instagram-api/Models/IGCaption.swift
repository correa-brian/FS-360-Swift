//
//  IGCaption.swift
//  instagram-api
//
//  Created by Brian Correa on 4/13/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class IGCaption: NSObject {
    
    var captionText: String!
        
    func populate(info: Dictionary<String, AnyObject>){
            
        if let captionInfo = info["caption"] as? Dictionary<String, AnyObject> {
//            print("CAPTION: ----------------\(captionInfo)")
            
                if let c = captionInfo["text"] as? String {
                    self.captionText = c
                    print("\(c)")
                }
        }
    }
        
}
