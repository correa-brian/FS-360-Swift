//
//  FFHomeViewController.swift
//  FoodFinder
//
//  Created by Brian Correa on 4/15/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class FFHomeViewController: FFViewController {

    override func loadView() {
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.lightGrayColor()
        
        let googleBtn = UIButton(frame: CGRect())
        
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

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
