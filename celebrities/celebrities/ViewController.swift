//
//  ViewController.swift
//  celebrities
//
//  Created by Brian Correa on 4/6/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var obamaImage: UIImageView!
    @IBOutlet var devitoImage: UIImageView!
    @IBOutlet var hernandezImage: UIImageView!
    @IBOutlet var selectedLabel: UILabel!
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let celebrities = [self.hernandezImage, self.obamaImage, self.devitoImage]
        
        for celebrityImage in celebrities {
            let selector = #selector(ViewController.selectCelebrity(_:))
            let tapGesture = UITapGestureRecognizer(target: self, action: selector)
            celebrityImage.addGestureRecognizer(tapGesture)
        }
        
    }
    
    func selectCelebrity(sender: UIGestureRecognizer){
        
        let view = sender.view
        print("selectCelebrity: \(view!.tag)")
        
        switch view!.tag {
        case 0:
            self.selectedLabel.text = "Danny Devito"
        case 1:
            self.selectedLabel.text = "Aaron Hernandez"
        case 2:
            self.selectedLabel.text = "Barack Obama"
        default:
            self.selectedLabel.text = ""
        }
        
    }
    
    @IBAction func btnNext() {
        print("buttonTapped")
        
        let forumVc = BCForumViewController()
        forumVc.title = self.selectedLabel.text
        self.navigationController?.pushViewController(forumVc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
}