//
//  SlidesController.swift
//  second-views
//
//  Created by Brian Correa on 4/4/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class SlidesController: UIViewController {
    
    @IBOutlet var slideLabel: UILabel!
    @IBOutlet var companyImage: UIImageView!
    var imagesArray = ["facebook.png", "twitter.png", "apple.png", "snapchat"]
    var index = 0
    
    @IBAction func showCompanyImage(sender: UIButton){
        let company = sender.titleLabel?.text
        print("showCompany: \(company!)")
        
        let imageMap = ["Facebook": "facebook.png", "Twitter": "twitter.png", "Apple": "apple.png", "Snapchat": "snapchat.png"]
        self.companyImage.image = UIImage(named: imageMap[company!]!)
        
        self.slideLabel.text = "I'd like to work at \(company!)"
    }
    
    @IBAction func showImage(){
        print("ShowNextLogo")
        index = index+1
        
        if(index == self.imagesArray.count){//reset
            index=0
        }
        
        let nextImage = self.imagesArray[index]
        
        self.companyImage.image = UIImage(named: nextImage)
        self.slideLabel.text = "Pick one already"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.companyImage.image = UIImage(named: "facebook.png")
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
