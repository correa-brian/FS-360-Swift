//
//  WAViewController.swift
//  WhereAmI
//
//  Created by Brian Correa on 4/20/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class WAViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func shiftView(position: CGFloat){
        
        if(self.view.frame.origin.y == position){
            return
        }
        
        UIView.animateWithDuration(0.25,
                                   delay: 0,
                                   options: .CurveEaseInOut,
                                   animations: {
                                    var frame = self.view.frame
                                    frame.origin.y = position
                                    self.view.frame = frame
            },
                                   completion: nil)
        
    }

}
