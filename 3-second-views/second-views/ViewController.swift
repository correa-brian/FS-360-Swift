//
//  ViewController.swift
//  second-views
//
//  Created by Brian Correa on 4/4/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var homeTextField: UITextField!
    @IBOutlet var homeLabel: UILabel!
    
    
    @IBAction func buttonTapped(){
        print("buttonTapped")
        
        let currentText = self.homeTextField.text
        self.homeLabel.text = currentText
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeLabel.font = UIFont(name: "Arial", size: 18)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

