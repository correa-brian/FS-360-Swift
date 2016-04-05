//
//  ScrollController.swift
//  second-views
//
//  Created by Brian Correa on 4/4/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ScrollController: UIViewController {

    @IBOutlet var imageScrollView: UIScrollView!
    
    var imagesArray = ["mets.png", "yankees.png", "giants.png"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageScrollView.contentSize = CGSize(width: 800, height: 200)
        self.imageScrollView.pagingEnabled = true
        self.imageScrollView.showsHorizontalScrollIndicator = false
//        self.imageScrollView.backgroundColor = UIColor.blueColor()
        
        let firstView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
        firstView.image = UIImage(named: "facebook.png")
        self.imageScrollView.addSubview(firstView)
        
        let secondView = UIImageView(frame: CGRect(x:200, y:0, width:200, height:200))
        secondView.image = UIImage(named: "twitter.png")
        self.imageScrollView.addSubview(secondView)
        
        let thirdView = UIImageView(frame: CGRect(x:400, y:0, width:200, height:200))
        thirdView.image = UIImage(named: "apple.png")
        self.imageScrollView.addSubview(thirdView)
        
        let fourthView = UIImageView(frame: CGRect(x:600, y:0, width:200, height:200))
        fourthView.image = UIImage(named: "snapchat.png")
        self.imageScrollView.addSubview(fourthView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
