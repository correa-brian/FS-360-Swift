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
    
    var celebritiesDict = [String: BCCelebrity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dannyDeVito = BCCelebrity()
        dannyDeVito.name = "Danny DeVito"
        dannyDeVito.image = "devito.png"
        self.celebritiesDict[dannyDeVito.name] = dannyDeVito
        
        let aaronHernandez = BCCelebrity()
        aaronHernandez.name = "Aaron Hernandez"
        aaronHernandez.image = "hernandez.png"
        self.celebritiesDict[aaronHernandez.name] = aaronHernandez
        
        let barackObama = BCCelebrity()
        barackObama.name = "Barack Obama"
        barackObama.image = "obama.png"
        self.celebritiesDict[barackObama.name] = barackObama
        
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
            self.selectedLabel.text = "Danny DeVito"
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
        
        let selectedCelebrity = self.celebritiesDict[self.selectedLabel.text!]
        forumVc.selectedCelebrity = selectedCelebrity
        self.navigationController?.pushViewController(forumVc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
}