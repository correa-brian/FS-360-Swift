//
//  ViewController.swift
//  disgraced-athletes
//
//  Created by Brian Correa on 4/7/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - My Stuff
    
    @IBOutlet var imageScrollView: UIScrollView!
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var nxtButton: UIButton!
    
    @IBAction func showNextController() {
        print("showNextController")
        
        let chatVc = BCChatViewController()
        
        chatVc.title = self.imageLabel.text
        
        self.navigationController?.pushViewController(chatVc, animated: true)
        
    }
    
    var imagesArray = ["armstrong.png", "arod.png", "phelps.png"]
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        
        let w = self.imagesArray.count*Int(self.imageScrollView.frame.size.width)
        
        self.imageScrollView.contentSize = CGSize(width: w, height: 0)
        self.imageScrollView.pagingEnabled = true
        self.imageScrollView.showsHorizontalScrollIndicator = false
        
        self.imageScrollView.delegate = self
        
        for image in self.imagesArray {
            let index = self.imagesArray.indexOf(image)
            let xOrigin = index!*200
            let imageView = UIImageView(frame: CGRect(x: xOrigin, y: 0, width: 200, height: 200))
            imageView.image = UIImage(named: image)
            self.imageScrollView.addSubview(imageView)
        }
        
        self.imageLabel.textColor = UIColor.blackColor()
        self.imageLabel.text = "Lance DopeStrong"
        
        let y = self.imageScrollView.frame.origin.y+self.imageScrollView.frame.size.height+30
        
//        self.nxtButton = UIButton(type: .Custom)
        self.nxtButton.autoresizingMask = .FlexibleTopMargin
        self.nxtButton.frame = CGRect(x: 0, y: y, width: 200, height: 100)
        self.nxtButton.center = CGPoint(x: 0.5*frame.size.width, y: nxtButton.center.y)
        self.nxtButton.backgroundColor = UIColor(red: 222/255, green: 165/225, blue: 164/255, alpha: 1)
        self.nxtButton.setTitle("Go", forState: .Normal)
        self.nxtButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.nxtButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.nxtButton.layer.borderWidth = 1.0
        self.nxtButton.layer.cornerRadius = 5.0
        self.nxtButton.layer.masksToBounds = true
        
    }
    
    //MARK: - Callback Function
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        print("scrollViewDidEndDecelerating: \(scrollView.contentOffset.x)")
        
        let offset = scrollView.contentOffset.x
        
        if (offset == 0){
            self.imageLabel.text = "Lance DopeStrong"
        }
        if (offset == 200){
            self.imageLabel.text = "Alex Roidriguez"
        }
        if (offset == 400){
            self.imageLabel.text = "Michael Bong-Phelps"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

