//
//  IGHomeViewControlllerViewController.swift
//  instagram-api
//
//  Created by Brian Correa on 4/17/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class IGHomeViewControlllerViewController: UIViewController {

    //MARK: Properties
    
    var jamesBtn: UIButton!
    var harperBtn: UIButton!
    var newtonBtn: UIButton!
    
    //MARK: Functions
    func showFeed(_: UIButton){
        
    }
    
//    func btnNextAction(btn: UIButton){
//        print("btnNextAction")
//        
//        let forumVc = BCForumViewController()
//        
//        self.navigationController?.pushViewController(forumVc, animated: true)
    
    //MARK: Lifecycle Methods
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        let originX = 0.5*frame.size.width
        
        self.jamesBtn = UIButton(type: .Custom)
        self.jamesBtn.autoresizingMask = .FlexibleTopMargin
        self.jamesBtn.frame = CGRect(x: originX-100, y: 100, width: 200, height: 44)
        self.jamesBtn.setTitle("Lebron James", forState: .Normal)
        self.jamesBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.jamesBtn.backgroundColor = UIColor.whiteColor()
        self.jamesBtn.layer.borderColor = UIColor.blueColor().CGColor
        self.jamesBtn.layer.borderWidth = 1.0
        self.jamesBtn.layer.cornerRadius = 5.0
        self.jamesBtn.layer.masksToBounds = true
        
        view.addSubview(self.jamesBtn)
        
        self.harperBtn = UIButton(type: .Custom)
        self.harperBtn.autoresizingMask = .FlexibleTopMargin
        self.harperBtn.frame = CGRect(x: originX-100, y: 200, width: 200, height: 44)
        self.harperBtn.setTitle("Bryce Harper", forState: .Normal)
        self.harperBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.harperBtn.backgroundColor = UIColor.whiteColor()
        self.harperBtn.layer.borderColor = UIColor.blueColor().CGColor
        self.harperBtn.layer.borderWidth = 1.0
        self.harperBtn.layer.cornerRadius = 5.0
        self.harperBtn.layer.masksToBounds = true
        
        view.addSubview(self.harperBtn)
        
        self.newtonBtn = UIButton(type: .Custom)
        self.newtonBtn.autoresizingMask = .FlexibleTopMargin
        self.newtonBtn.frame = CGRect(x: originX-100, y: 300, width: 200, height: 44)
        self.newtonBtn.setTitle("Cam Newton", forState: .Normal)
        self.newtonBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.newtonBtn.backgroundColor = UIColor.whiteColor()
        self.newtonBtn.layer.borderColor = UIColor.blueColor().CGColor
        self.newtonBtn.layer.borderWidth = 1.0
        self.newtonBtn.layer.cornerRadius = 5.0
        self.newtonBtn.layer.masksToBounds = true
        
        view.addSubview(self.newtonBtn)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
