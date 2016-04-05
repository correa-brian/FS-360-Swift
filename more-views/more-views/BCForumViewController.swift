//
//  BCForumViewController.swift
//  more-views
//
//  Created by Brian Correa on 4/5/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCForumViewController: UIViewController, UITextFieldDelegate {
    
    var imagesArray = ["apple.png", "facebook.png", "snapchat.png", "twitter.png"]
    var commentField: UITextField!
    var comments = Array<String>()
    var companyScroll: UIScrollView!
    
    
    override func loadView() {
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.greenColor()
        
        self.commentField = UITextField(frame: CGRect(x: 20, y:20, width: frame.size.width-40, height: 32))
        self.commentField.delegate = self
        self.commentField.autocorrectionType = .No
        self.commentField.placeholder = "Enter Comment"
        self.commentField.backgroundColor = UIColor.whiteColor()
        self.commentField.borderStyle = .RoundedRect
        view.addSubview(self.commentField)
        
        self.view = view
        
        self.companyScroll = UIScrollView(frame: CGRect(x: 0, y: 270, width: 200, height: 200))
        self.companyScroll.backgroundColor = UIColor.blueColor()
//        let w = self.imagesArray.count * Int(self.companyScroll.frame.size.width)
//        self.companyScroll.contentSize = CGSize(width: w, height: 0)
        
//        self.imageScroll.backgroundColor = UIColor.yellowColor()
//        self.imageScroll.delegate = self
//        
//        let w = self.imagesArray.count * Int(self.imageScroll.frame.size.width)
//        
//        self.imageScroll.contentSize = CGSize(width: w, height: 0)
//        self.imageScroll.pagingEnabled = true
//        
//        for image in self.imagesArray {
//            let index = self.imagesArray.indexOf(image)
//            let xOrigin = index!*200
//            let imageView = UIImageView(frame: CGRect(x: xOrigin, y:0, width: 200, height: 200))
//            imageView.image = UIImage(named: image)
//            self.imageScroll.addSubview(imageView)
//        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder() //makes keyboard go away
            
            let comment = self.commentField.text
            self.comments.append(comment!)
            print("\(self.comments)")
            self.commentField.text = ""
            
            return true
        
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
