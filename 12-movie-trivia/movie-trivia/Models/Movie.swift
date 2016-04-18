//
//  Movie.swift
//  movie-trivia
//
//  Created by Brian Correa on 4/18/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    //MARK: Properties
    
    var movieOverview: String!
    var movieTitle: String!
    var movieId: Int!
    
    //MARK: Parsing Function
    
    func populate(movieInfo: Dictionary<String, AnyObject>){
        if let overview = movieInfo["overview"] as? String {
//            print("-------------------------\(overview)")
            self.movieOverview = overview
        }
        if let title = movieInfo["title"] as? String {
//            print("\(title)")
            self.movieTitle = title
        }
        if let id = movieInfo["id"] as? Int{
//            print("\(id)")
            self.movieId = id
        }
    }

}
