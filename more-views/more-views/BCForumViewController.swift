//
//  BCForumViewController.swift
//  more-views
//
//  Created by Brian Correa on 4/5/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCForumViewController: UIViewController, UITextFieldDelegate {
    
    var commentField: UITextField!
    var comments = Array<String>()
    var companyImageView: UIImageView!
    var selectedImage: String!
    
    override func loadView() {
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.commentField = UITextField(frame: CGRect(x: 20, y:20, width: frame.size.width-40, height: 32))
        self.commentField.delegate = self
        self.commentField.autocorrectionType = .No
        self.commentField.placeholder = "Enter Comment"
        self.commentField.backgroundColor = UIColor.whiteColor()
        self.commentField.borderStyle = .RoundedRect
        view.addSubview(self.commentField)
        
        self.view = view
        
        let y = self.commentField.frame.origin.y+self.commentField.frame.size.height+20
        self.companyImageView = UIImageView(frame: CGRect(x: 60, y: y, width: 200, height: 200))
        self.companyImageView.alpha = 0.3
        
        if (selectedImage == "Apple"){
            self.companyImageView.image = UIImage(named: self.selectedImage)
        }

        if (self.selectedImage == "Facebook"){
            self.companyImageView.image = UIImage(named: self.selectedImage)
        }
        
        if (self.selectedImage == "Snapchat"){
            self.companyImageView.image = UIImage(named: self.selectedImage)
        }
        
        if (self.selectedImage == "Twitter"){
            self.companyImageView.image = UIImage(named: self.selectedImage)
        }
        
        view.addSubview(self.companyImageView)
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
