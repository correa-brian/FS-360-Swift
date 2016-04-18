//
//  ViewController.swift
//  US-presidents
//
//  Created by Brian Correa on 4/6/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageClinton: UIImageView!
    @IBOutlet var imageBush: UIImageView!
    @IBOutlet var imageObama: UIImageView!
    @IBOutlet var selectedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presidents = [self.imageClinton, self.imageBush, self.imageObama]
        
        
        for presidentImage in presidents {
            let selector = #selector(ViewController.selectPresident(_:))
            let tapGesture = UITapGestureRecognizer(target: self, action: selector)
            presidentImage.addGestureRecognizer(tapGesture)
        
        }
        
    }
    
    func selectPresident (sender: UIGestureRecognizer){
        
        let view = sender.view
        print ("selectPresident: \(view!.tag)")
        
        switch view!.tag {
        case 0:
            self.selectedLabel.text = "President Clinton"
        case 1:
            self.selectedLabel.text = "President Bush"
        case 2:
            self.selectedLabel.text = "President Obama"
        default:
            self.selectedLabel.text = ""
        }
        
    }
    
    @IBAction func btnNext(){
        print("buttonTapped")
        
        let forumVc = BCChatViewController()
        forumVc.title = self.selectedLabel.text
        self.navigationController?.pushViewController(forumVc, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

