//
//  SlidesViewController.swift
//  first-views
//
//  Created by Brian Correa on 4/4/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class SlidesViewController: UIViewController {
    
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var imageScrollView: UIScrollView!
    var imagesArray = ["mets.png", "yankees.png", "giants.png"]
    var index = 0
    
    @IBAction func showTeamImage(sender: UIButton){
        let team = sender.titleLabel?.text
        print("showTeam: \(team!)")
        
        let imageMap = ["Mets": "mets.png", "Yankees":"yankees.png", "Giants":"giants.png"]
        self.teamImage.image = UIImage(named: imageMap[team!]!)
    }
    
    @IBAction func showImage(){
        print("ShowNextImage")
        index = index+1
        
        if (index == self.imagesArray.count){ //reset
            index = 0
        }
        
        let nextImage = self.imagesArray[index]
        
        self.teamImage.image = UIImage(named: nextImage)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageScrollView.contentSize = CGSize(width: 800, height: 200)
        self.imageScrollView.pagingEnabled = true
        self.imageScrollView.showsHorizontalScrollIndicator = false
        
        let firstImageView = UIImageView(frame: CGRect(x: 0, y:0, width:200, height: 200))
        firstImageView.image = UIImage(named: "mets.png")
        self.imageScrollView.addSubview(firstImageView)
        
        let secondImageView = UIImageView(frame: CGRect(x: 200, y:0, width:200, height: 200))
        secondImageView.image = UIImage(named: "yankees.png")
        self.imageScrollView.addSubview(secondImageView)
        
        let thirdImageView = UIImageView(frame: CGRect(x: 400, y:0, width:200, height: 200))
        thirdImageView.image = UIImage(named: "giants.png")
        self.imageScrollView.addSubview(thirdImageView)
    
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
