//
//  ViewController.swift
//  more-views
//
//  Created by Brian Correa on 4/5/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var imageScroll: UIScrollView!
    var imagesArray = ["apple.png", "facebook.png", "snapchat.png", "twitter.png"]
    var companyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        self.edgesForExtendedLayout = .None
        
        let frame = UIScreen.mainScreen().bounds //frame of entire device
        
        self.companyLabel = UILabel(frame: CGRect(x: 20, y: 20, width: frame.size.width-40, height: 32))
        //self.companyLabel.backgroundColor = UIColor.whiteColor()
        //self.companyLabel.textColor = UIColor.blackColor()
        self.companyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.companyLabel.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        self.companyLabel.textAlignment = .Center
        self.companyLabel.text = "Apple"
        self.view.addSubview(companyLabel)
        
        self.imageScroll.backgroundColor = UIColor.whiteColor()
        self.imageScroll.delegate = self
        
        let w = self.imagesArray.count * Int(self.imageScroll.frame.size.width)
        
        self.imageScroll.contentSize = CGSize(width: w, height: 0)
        self.imageScroll.pagingEnabled = true
        
        for image in self.imagesArray {
            let index = self.imagesArray.indexOf(image)
            let xOrigin = index!*200
            let imageView = UIImageView(frame: CGRect(x: xOrigin, y:0, width: 200, height: 200))
            imageView.image = UIImage(named: image)
            self.imageScroll.addSubview(imageView)
        }
        
//        let btnWidth = CGFloat(100)
        let y = self.imageScroll.frame.origin.y+self.imageScroll.frame.size.height+30
//        let x = 0.5*(frame.size.width-btnWidth)
        
        let btnNext = UIButton(type: .Custom)
        btnNext.autoresizingMask = .FlexibleTopMargin
        btnNext.frame = CGRect(x: 0, y: y, width: 200, height: 44)
        btnNext.center = CGPoint(x: 0.5*frame.size.width, y: btnNext.center.y)
        btnNext.backgroundColor = UIColor(red: 0.25, green: 0.75, blue: 0.5, alpha: 1)
        btnNext.layer.borderColor = UIColor.lightGrayColor().CGColor
        btnNext.layer.borderWidth = 1.0
        btnNext.layer.cornerRadius = 5.0
        btnNext.layer.masksToBounds = true
        btnNext.setTitle("Next", forState: .Normal)
        btnNext.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        btnNext.addTarget(self, action: #selector(ViewController.btnNextAction(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnNext)
    }
    
    func btnNextAction(btn: UIButton){
        print("btnNextAction")
        
        let forumVc = BCForumViewController()
        
        self.navigationController?.pushViewController(forumVc, animated: true)
        
        forumVc.selectedImage = self.companyLabel.text
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView){
        self.companyLabel.text = nil
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        print("scrollViewDidEndDecelerating: \(scrollView.contentOffset.x)")
        let offset = scrollView.contentOffset.x
        if (offset == 0){
            self.companyLabel.text = "Apple"
            self.companyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            self.companyLabel.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        }
        if (offset == 200){
            self.companyLabel.text = "Facebook"
            self.companyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            self.companyLabel.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
            
        }
        if (offset == 400){
            self.companyLabel.text = "Snapchat"
            self.companyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            self.companyLabel.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 0/255, alpha: 1)
        }
        if (offset == 600){
            self.companyLabel.text = "Twitter"
            self.companyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            self.companyLabel.backgroundColor = UIColor(red: 85/255, green: 172/255, blue: 238/255, alpha: 1)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
