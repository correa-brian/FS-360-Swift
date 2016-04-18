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
    var matchesCount = 0
    
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
        
        self.titleLabel = UILabel(frame: CGRect(x: originX-150, y: 20, width: 300, height: 44))
        self.titleLabel.textAlignment = .Center
        self.titleLabel.text = "Welcome to the Movie Machine"
        
        view.addSubview(self.titleLabel)
        
        self.movieSummary = UILabel(frame: CGRect(x: 10, y: 70, width: w-20, height: 200))
        self.movieSummary.textAlignment = .Center
        self.movieSummary.numberOfLines = 0
        self.movieSummary.lineBreakMode = .ByWordWrapping
        self.movieSummary!.adjustsFontSizeToFitWidth = true
        self.movieSummary?.font = UIFont(name: "Arial", size: 16)
        self.movieSummary.text = "Movie Summary"
        self.movieSummary.layer.masksToBounds = true
        self.movieSummary.layer.borderWidth = 1.0
        self.movieSummary.layer.borderColor = UIColor.blackColor().CGColor
        self.movieSummary.layer.cornerRadius = 5.0
        
        view.addSubview(self.movieSummary)
        
        self.btn1 = UIButton(type: .Custom)
        self.btn1.autoresizingMask = .FlexibleTopMargin
        self.btn1.frame = CGRect(x: originX-150, y: 350, width: 300, height: 44)
        self.btn1.setTitle("1st Choice", forState: .Normal)
        self.btn1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn1.titleLabel!.font = UIFont(name: "Arial", size: 14)
        self.btn1.titleLabel?.numberOfLines = 0
        self.btn1.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn1.layer.borderColor = UIColor.blackColor().CGColor
        self.btn1.layer.borderWidth = 1.0
        self.btn1.layer.cornerRadius = 4.0
        self.btn1.layer.masksToBounds = true
        
        view.addSubview(self.btn1)
        
        self.btn2 = UIButton(type: .Custom)
        self.btn2.autoresizingMask = .FlexibleTopMargin
        self.btn2.frame = CGRect(x: originX-150, y: 400, width: 300, height: 44)
        self.btn2.setTitle("2nd Choice", forState: .Normal)
        self.btn2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn2.titleLabel!.font = UIFont(name: "Arial", size: 14)
        self.btn2.titleLabel?.numberOfLines = 0
        self.btn2.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn2.layer.borderColor = UIColor.blackColor().CGColor
        self.btn2.layer.borderWidth = 1.0
        self.btn2.layer.cornerRadius = 4.0
        self.btn2.layer.masksToBounds = true
        
        view.addSubview(self.btn2)
        
        self.btn3 = UIButton(type: .Custom)
        self.btn3.autoresizingMask = .FlexibleTopMargin
        self.btn3.frame = CGRect(x: originX-150, y: 450, width: 300, height: 44)
        self.btn3.setTitle("3rd Choice", forState: .Normal)
        self.btn3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn3.titleLabel!.font = UIFont(name: "Arial", size: 14)
        self.btn3.titleLabel?.numberOfLines = 0
        self.btn3.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn3.layer.borderColor = UIColor.blackColor().CGColor
        self.btn3.layer.borderWidth = 1.0
        self.btn3.layer.cornerRadius = 4.0
        self.btn3.layer.masksToBounds = true
        
        view.addSubview(self.btn3)
        
        self.btn4 = UIButton(type: .Custom)
        self.btn4.autoresizingMask = .FlexibleTopMargin
        self.btn4.frame = CGRect(x: originX-150, y: 500, width: 300, height: 44)
        self.btn4.setTitle("4th Choice", forState: .Normal)
        self.btn4.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn4.titleLabel!.font = UIFont(name: "Arial", size: 14)
        self.btn4.titleLabel?.numberOfLines = 0
        self.btn4.titleLabel?.adjustsFontSizeToFitWidth = true
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
                    self.generateFields()
                }
            }
        }
    }

    func randomMovie() -> Int {
        
        let randomIndex = Int(arc4random_uniform(UInt32(self.moviesArray.count)))
        return randomIndex
    }
    
    func generateFields(){
  
        let summary = self.moviesArray[0]
//        let summary = self.moviesArray[self.randomMovie()]
        
        var fields = Array<Int>()

        let btn1 = self.moviesArray[0]
        let btn2 = self.moviesArray[1]
        let btn3 = self.moviesArray[2]
        let btn4 = self.moviesArray[0]
        
//        let btn1 = self.moviesArray[self.randomMovie()]
//        let btn2 = self.moviesArray[self.randomMovie()]
//        let btn3 = self.moviesArray[self.randomMovie()]
//        let btn4 = self.moviesArray[self.randomMovie()]
        
        fields.append(btn1.movieId)
        fields.append(btn2.movieId)
        fields.append(btn3.movieId)
        fields.append(btn4.movieId)
        
        print("\(fields)")
        
        for i in fields {
            if (i == summary.movieId){
                self.matchesCount = self.matchesCount+1
            }
        }
        
        print("\(self.matchesCount)")
        
        self.movieSummary.text = summary.movieOverview

        self.btn1.setTitle(btn1.movieTitle, forState: .Normal)
        self.btn2.setTitle(btn2.movieTitle, forState: .Normal)
        self.btn3.setTitle(btn3.movieTitle, forState: .Normal)
        self.btn4.setTitle(btn4.movieTitle, forState: .Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
