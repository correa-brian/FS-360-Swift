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
    
    //Initialized Variables
    var summary = Movie()
    var moviesArray = Array<Movie>()
    var matchesCount = 0
    var duplicates = 0
    var score = 0
    
    //UI Elements
    var scoreLabel: UILabel!
    var titleLabel: UILabel!
    var movieSummary: UILabel!
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    
    //MARK: Lifecycle Methods
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 253/255, alpha: 1)
        
        let w = frame.size.width
        let originX = frame.size.width * 0.5
        
        self.titleLabel = UILabel(frame: CGRect(x: originX-150, y: 20, width: 300, height: 44))
        self.titleLabel.textAlignment = .Center
        self.titleLabel.text = "Movie Golf"
        
        view.addSubview(self.titleLabel)
        
        self.movieSummary = UILabel(frame: CGRect(x: 10, y: 70, width: w-20, height: 200))
        self.movieSummary.textAlignment = .Center
        self.movieSummary.numberOfLines = 0
        self.movieSummary.lineBreakMode = .ByWordWrapping
        self.movieSummary!.adjustsFontSizeToFitWidth = true
        self.movieSummary?.font = UIFont(name: "ChalkboardSE-Light", size: 16)
        self.movieSummary!.textColor = UIColor.blackColor()
//        self.movieSummary!.textColor = UIColor(red: 209/255, green: 220/255, blue: 255/255, alpha: 1)
        self.movieSummary.text = self.summary.movieOverview
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
        self.btn1.titleLabel!.font = UIFont(name: "ChalkboardSE-Light", size: 14)
        self.btn1.titleLabel?.numberOfLines = 0
        self.btn1.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn1.layer.borderColor = UIColor.blackColor().CGColor
        self.btn1.layer.borderWidth = 1.0
        self.btn1.layer.cornerRadius = 4.0
        self.btn1.layer.masksToBounds = true
        
        self.btn1.addTarget(self, action: #selector(MTHomeViewController.selectedAnswer(_:)), forControlEvents: .TouchUpInside)
        
        view.addSubview(self.btn1)
        
        self.btn2 = UIButton(type: .Custom)
        self.btn2.autoresizingMask = .FlexibleTopMargin
        self.btn2.frame = CGRect(x: originX-150, y: 400, width: 300, height: 44)
        self.btn2.setTitle("2nd Choice", forState: .Normal)
        self.btn2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn2.titleLabel!.font = UIFont(name: "ChalkboardSE-Light", size: 14)
        self.btn2.titleLabel?.numberOfLines = 0
        self.btn2.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn2.layer.borderColor = UIColor.blackColor().CGColor
        self.btn2.layer.borderWidth = 1.0
        self.btn2.layer.cornerRadius = 4.0
        self.btn2.layer.masksToBounds = true
        
        self.btn2.addTarget(self, action: #selector(MTHomeViewController.selectedAnswer(_:)), forControlEvents: .TouchUpInside)
        
        view.addSubview(self.btn2)
        
        self.btn3 = UIButton(type: .Custom)
        self.btn3.autoresizingMask = .FlexibleTopMargin
        self.btn3.frame = CGRect(x: originX-150, y: 450, width: 300, height: 44)
        self.btn3.setTitle("3rd Choice", forState: .Normal)
        self.btn3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn3.titleLabel!.font = UIFont(name: "ChalkboardSE-Light", size: 14)
        self.btn3.titleLabel?.numberOfLines = 0
        self.btn3.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn3.layer.borderColor = UIColor.blackColor().CGColor
        self.btn3.layer.borderWidth = 1.0
        self.btn3.layer.cornerRadius = 4.0
        self.btn3.layer.masksToBounds = true
        
        self.btn3.addTarget(self, action: #selector(MTHomeViewController.selectedAnswer(_:)), forControlEvents: .TouchUpInside)
        
        view.addSubview(self.btn3)
        
        self.btn4 = UIButton(type: .Custom)
        self.btn4.autoresizingMask = .FlexibleTopMargin
        self.btn4.frame = CGRect(x: originX-150, y: 500, width: 300, height: 44)
        self.btn4.setTitle("4th Choice", forState: .Normal)
        self.btn4.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btn4.titleLabel!.font = UIFont(name: "ChalkboardSE-Light", size: 14)
        self.btn4.titleLabel?.numberOfLines = 0
        self.btn4.titleLabel?.adjustsFontSizeToFitWidth = true
        self.btn4.layer.borderColor = UIColor.blackColor().CGColor
        self.btn4.layer.borderWidth = 1.0
        self.btn4.layer.cornerRadius = 4.0
        self.btn4.layer.masksToBounds = true
        
        self.btn4.addTarget(self, action: #selector(MTHomeViewController.selectedAnswer(_:)), forControlEvents: .TouchUpInside)
        
        view.addSubview(self.btn4)

        self.scoreLabel = UILabel(frame: CGRect(x: originX+45, y: 0, width: 100, height: 44))
        self.scoreLabel.textAlignment = .Right
        self.scoreLabel.text = "Score: \(self.score)"
        
        view.addSubview(self.scoreLabel)
        
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
  
        self.duplicates = 0
        self.matchesCount = 0
        
        self.summary = self.moviesArray[self.randomMovie()]
        
        let btn1 = self.moviesArray[self.randomMovie()]
        let btn2 = self.moviesArray[self.randomMovie()]
        let btn3 = self.moviesArray[self.randomMovie()]
        let btn4 = self.moviesArray[self.randomMovie()]
        
        var movieIdArray = Array<Int>()

        movieIdArray.append(btn1.movieId)
        movieIdArray.append(btn2.movieId)
        movieIdArray.append(btn3.movieId)
        movieIdArray.append(btn4.movieId)
        
        print("Overview id: \(self.summary.movieId)")
        print("id array: \(movieIdArray)")
        
        //Checking array for matches to overview id
        
        for id in movieIdArray {
            if (id == self.summary.movieId) {
                self.matchesCount = self.matchesCount+1
            }
            for idOff in movieIdArray{
                if(idOff == id){
                    self.duplicates = self.duplicates+1
                }
            }
        }
        
        print("\(self.matchesCount)")
        print("\(self.duplicates)")
        
        self.movieSummary.text = self.summary.movieOverview

        self.btn1.setTitle(btn1.movieTitle, forState: .Normal)
        self.btn2.setTitle(btn2.movieTitle, forState: .Normal)
        self.btn3.setTitle(btn3.movieTitle, forState: .Normal)
        self.btn4.setTitle(btn4.movieTitle, forState: .Normal)
        
        //Checking matches for =!
        
        if(self.matchesCount != 1 || self.duplicates != 4){
            
            self.generateFields()
        }
    }
    
    func selectedAnswer(sender: UIButton) {
        
        print("selectedAnswer")
        
        if (sender.titleLabel!.text == self.summary.movieTitle){
            print("success")
            self.score = self.score+1
            self.scoreLabel.text = "Score: \(self.score)"
            self.matchesCount = 0
            self.duplicates = 0
            self.generateFields()
        }
        else {
            self.score = 0
            self.scoreLabel.text = "Score: \(self.score)"
            self.generateFields()
            print("Gotta Start Over")
            
            let alert = UIAlertController(title: "Game Over", message: "Better Luck Next Time", preferredStyle: .Alert)
            
            let okBtn = UIAlertAction(title: "Start Over", style: .Default, handler: nil)
            
            alert.addAction(okBtn)
            
            presentViewController(alert, animated: true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
