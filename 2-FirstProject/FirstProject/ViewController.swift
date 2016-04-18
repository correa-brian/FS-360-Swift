//
//  ViewController.swift
//  FirstProject
//
//  Created by Brian Correa on 4/2/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnSwitch: UISwitch!
    @IBOutlet var lblHome: UILabel!
    @IBOutlet var homeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSwitch.addTarget(self, action: "toggleSwitch:", forControlEvents: .ValueChanged)
    }
    
    func toggleSwitch(sender: UISwitch){
        var onOrOff = ""
        if(sender.on == true){
            onOrOff = "ON"
            self.lblHome.textColor = UIColor.greenColor()
            self.lblHome.backgroundColor = UIColor.redColor()
            self.homeTextField.font = UIFont(name: "Arial", size: 22)
        }
        else{
            onOrOff = "OFF"
            self.lblHome.textColor = UIColor.redColor()
            self.lblHome.backgroundColor = UIColor.greenColor()
            self.homeTextField.font = UIFont(name: "Helvetica", size: 12)
        }
        
        print("toggleSwitch: \(onOrOff)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

