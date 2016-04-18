//
//  MTHomeViewController.swift
//  movie-trivia
//
//  Created by Brian Correa on 4/18/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class MTHomeViewController: MovieTriviaViewController {
    
    
    //MARK: Lifecycle Methods
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=98b525225a2fe71d855108eca4fdf12d"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                print("\(JSON)")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
