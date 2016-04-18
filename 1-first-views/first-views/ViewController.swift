//
//  ViewController.swift
//  first-views
//
//  Created by Brian Correa on 4/4/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var homeButton: UIButton!
    
    @IBAction func buttonTapped(){
        print("buttonTapped")
        
        self.nameLabel.text = self.textField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "Welcome"
        self.nameLabel.textColor = UIColor.blueColor()
        self.nameLabel.font = UIFont(name: "Arial", size: 20)
        self.nameLabel.layer.borderColor = UIColor.greenColor().CGColor
        self.nameLabel.layer.borderWidth = 1
        self.nameLabel.backgroundColor = UIColor.whiteColor()
        self.nameLabel.alpha = 0.25
        
        
        self.textField.backgroundColor = UIColor.orangeColor()
        self.textField.textColor = UIColor.brownColor()
        self.textField.keyboardType = .PhonePad
        
        self.homeButton.setTitle("Tap Me", forState: .Normal)
        self.homeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
