//
//  MTInstructionsViewController.swift
//  movie-trivia
//
//  Created by Brian Correa on 4/24/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class MTInstructionsViewController: MovieTriviaViewController {
    
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 85/255, green: 112/255, blue:178/255, alpha: 1)
        
        let originX = frame.size.width * 0.5
        
        
        let gameTitle = UILabel(frame: CGRect(x: originX-150, y: 100, width: 300, height: 50))
        gameTitle.textAlignment = .Center
        gameTitle.font = UIFont(name: "ChalkboardSE-Light", size: 40)
        gameTitle.textColor = UIColor(red: 249/255, green: 249/255, blue: 250/255, alpha: 1)
        gameTitle.text = "Movie Machine"
        gameTitle.layer.masksToBounds = true
        
        view.addSubview(gameTitle)
        
        
        let iconView = UIImageView(frame: CGRect(x: originX-100, y: 300, width: 200, height: 200))
        iconView.image = UIImage(named: "camera.png")
        
        view.addSubview(iconView)
        
        
        let playBtn = UIButton(type: .Custom)
        
        playBtn.frame = CGRect(x: originX-50, y: 275, width: 100, height: 44)
        playBtn.setTitle("Play", forState: .Normal)
        playBtn.autoresizingMask = .FlexibleTopMargin
        playBtn.setTitleColor(UIColor(red: 249/255, green: 249/255, blue: 250/255, alpha: 1), forState: .Normal)
        playBtn.titleLabel!.font = UIFont(name: "ChalkboardSE-Light", size: 18)
        playBtn.layer.borderColor = UIColor(red: 249/255, green: 249/255, blue: 250/255, alpha: 1).CGColor
        playBtn.layer.borderWidth = 1.0
        playBtn.layer.cornerRadius = 4.0
        playBtn.layer.masksToBounds = true
        
        playBtn.addTarget(self, action: #selector(MTInstructionsViewController.playGame(_:)), forControlEvents: .TouchUpInside)
        
        view.addSubview(playBtn)
        
        self.view = view
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func playGame(sender: UIButton){
        
        let gameVc = MTHomeViewController()
        
        self.navigationController?.pushViewController(gameVc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
