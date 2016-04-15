//
//  IGItem.swift
//  instagram-api
//
//  Created by Brian Correa on 4/14/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class IGItem: NSObject {

    var caption: String!
    var imageUrl: String!
    var image: UIImage?
    var isFetching = false
    var comments = Array<String>()
    var count: Int!
    
    func fetchImage(){
        if(self.isFetching == true){ //currently fetching, ignore
            return
        }
        
        self.isFetching = true
        Alamofire.request(.GET, self.imageUrl, parameters: nil).response { (request, response, data, error) in
            self.isFetching = false
            
            if (data != nil){
                self.image = UIImage(data: data!)
            }
            
        }
    }
    
    func populate(itemInfo: Dictionary<String, AnyObject>){
        
        if let captionInfo = itemInfo["caption"] as? Dictionary<String, AnyObject> {
            //            print("CAPTION: ----------------\(captionInfo)")
            
            if let text = captionInfo["text"] as? String {
                self.caption = text
                //                    print("\(text)")
            }
        }
        
        if let imageInfo = itemInfo["images"] as? Dictionary<String, AnyObject> {
//            print("IMAGE------------\(imageInfo)")
            
            if let low_resolution = imageInfo["low_resolution"] as? Dictionary<String, AnyObject> {
                if let url = low_resolution["url"] as? String {
                    self.imageUrl = url
//                    print("IMAGE URL == \(self.imageUrl)")
                }
            }
        }
        
        if let commentInfo = itemInfo["comments"] as? Dictionary<String, AnyObject> {
//            print("Comments:----------\(commentInfo)")
            
            if let count = commentInfo["count"] as? Int {
                self.count = count
            }
            
            if let data = commentInfo["data"] as? Array<Dictionary<String, AnyObject>> {
                
                    for info in data {
//                        print("TEXT: \(info)")
                        
                        if let text = info["text"] as? String {
                            
//                            print("\(text)")
                            self.comments.append(text)
                            
                        }
                    }
//                print("COMMENT--------------\(comments)")
            }
        }
        
    }
        
}
