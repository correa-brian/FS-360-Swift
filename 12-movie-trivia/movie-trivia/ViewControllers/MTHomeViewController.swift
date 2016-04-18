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
    
    //MARK: Properties
    
    //Objects
    var movieSummary: UILabel!
    var moviesArray = Array<Movie>()
//    var movie = Movie()
    
    //UI
    var titleLabel: UILabel!
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    
    //MARK: Lifecycle Methods
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        let w = frame.size.width
        let originX = frame.size.width * 0.5
        
        self.titleLabel = UILabel(frame: CGRect(x: originX-150, y: 25, width: 300, height: 44))
        self.titleLabel.textAlignment = .Center
        self.titleLabel.text = "Welcome to the Movie Machine"
        
        view.addSubview(self.titleLabel)
        
        self.movieSummary = UILabel(frame: CGRect(x: 20, y: 75, width: w-40, height: 200))
        self.movieSummary.textAlignment = .Center
        self.movieSummary.numberOfLines = 0
        self.movieSummary.lineBreakMode = .ByWordWrapping
        self.movieSummary?.font = UIFont(name: "Arial", size: 14)
        self.movieSummary.text = "Movie Summary"
        self.movieSummary.layer.borderWidth = 1.0
        self.movieSummary.layer.borderColor = UIColor.blackColor().CGColor
        self.movieSummary.layer.cornerRadius = 5.0
        
        view.addSubview(self.movieSummary)
        
        self.btn1 = UIButton(type: .Custom)
        self.btn1.autoresizingMask = .FlexibleTopMargin
        self.btn1.frame = CGRect(x: originX-120, y: 375, width: 100, height: 44)
        self.btn1.setTitle("1st Choice", forState: .Normal)
        self.btn1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn1.layer.borderColor = UIColor.blackColor().CGColor
        self.btn1.layer.borderWidth = 1.0
        self.btn1.layer.cornerRadius = 4.0
        self.btn1.layer.masksToBounds = true
        
        view.addSubview(self.btn1)
        
        self.btn2 = UIButton(type: .Custom)
        self.btn2.autoresizingMask = .FlexibleTopMargin
        self.btn2.frame = CGRect(x: originX+20, y: 375, width: 100, height: 44)
        self.btn2.setTitle("2nd Choice", forState: .Normal)
        self.btn2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn2.layer.borderColor = UIColor.blackColor().CGColor
        self.btn2.layer.borderWidth = 1.0
        self.btn2.layer.cornerRadius = 4.0
        self.btn2.layer.masksToBounds = true
        
        view.addSubview(self.btn2)
        
        self.btn3 = UIButton(type: .Custom)
        self.btn3.autoresizingMask = .FlexibleTopMargin
        self.btn3.frame = CGRect(x: originX-120, y: 450, width: 100, height: 44)
        self.btn3.setTitle("3rd Choice", forState: .Normal)
        self.btn3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn3.layer.borderColor = UIColor.blackColor().CGColor
        self.btn3.layer.borderWidth = 1.0
        self.btn3.layer.cornerRadius = 4.0
        self.btn3.layer.masksToBounds = true
        
        view.addSubview(self.btn3)
        
        self.btn4 = UIButton(type: .Custom)
        self.btn4.autoresizingMask = .FlexibleTopMargin
        self.btn4.frame = CGRect(x: originX+20, y: 450, width: 100, height: 44)
        self.btn4.setTitle("4th Choice", forState: .Normal)
        self.btn4.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn4.layer.borderColor = UIColor.blackColor().CGColor
        self.btn4.layer.borderWidth = 1.0
        self.btn4.layer.cornerRadius = 4.0
        self.btn4.layer.masksToBounds = true
        
        view.addSubview(self.btn4)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=98b525225a2fe71d855108eca4fdf12d"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
//                print("\(JSON)")
                if let results = JSON["results"] as? Array<Dictionary<String, AnyObject>>{
//                    print("\(results)")
                    
                    for movieInfo in results {
                        
                    let movie = Movie()
                    movie.populate(movieInfo)
                    self.moviesArray.append(movie)
                    }
                    self.firstQuestion()
                }
            }
        }
    }

    func randomMovie() -> Int {
        
        let randomIndex = Int(arc4random_uniform(UInt32(self.moviesArray.count)))
        return randomIndex
    }
    
    func firstQuestion(){
        
        self.movieSummary.text = self.moviesArray[self.randomMovie()].movieOverview
        self.btn1.setTitle(self.moviesArray[self.randomMovie()].movieTitle, forState: .Normal)
        self.btn2.setTitle(self.moviesArray[self.randomMovie()].movieTitle, forState: .Normal)
        self.btn3.setTitle(self.moviesArray[self.randomMovie()].movieTitle, forState: .Normal)
        self.btn4.setTitle(self.moviesArray[self.randomMovie()].movieTitle, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
