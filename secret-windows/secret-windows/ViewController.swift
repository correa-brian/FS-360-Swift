//
//  ViewController.swift
//  secret-windows
//
//  Created by Brian Correa on 4/10/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nxtButton: UIButton!
    @IBOutlet var homeSwitch: UISwitch!

    
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
      
        print("viewDidLoad")
        
        configurePageControl()
        
        self.edgesForExtendedLayout = .None
        
        
        self.nxtButton.setTitle("SLIDE", forState: .Normal)
        self.nxtButton.setTitleColor(UIColor(red: 247/255, green: 255/255, blue: 253/255, alpha: 1), forState: .Normal)
        self.nxtButton.backgroundColor = UIColor(red: 209/255, green: 220/255, blue: 255/255, alpha: 1)
        self.nxtButton.layer.borderColor = UIColor(red: 247/255, green: 255/255, blue: 253/255, alpha: 1).CGColor
        self.nxtButton.layer.borderWidth = 2.0
        self.nxtButton.layer.cornerRadius = 30.0
        self.nxtButton.layer.masksToBounds = true
        
        self.homeSwitch.on = false
    }
    
    func configurePageControl(){
        
        self.pageControl = UIPageControl(frame: CGRect(x: 50, y: 430, width: 200, height: 50))
        
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPage = 0
        
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 255/255, blue: 253/255, alpha: 1)
        
        self.pageControl.pageIndicatorTintColor = UIColor(red: 209/255, green: 220/255, blue: 255/255, alpha: 1)
        
        self.view.addSubview(pageControl)
        
//        self.pageControl.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
    
    }
    
    @IBAction func configureSwitch() {
        
        if (self.homeSwitch.on == true){
            print("setOn")
            view.backgroundColor = UIColor(red: 209/255, green: 220/255, blue: 255/255, alpha: 1)
            self.homeSwitch.onTintColor = UIColor(red: 255/255, green: 244/255, blue: 209/255, alpha: 1)
        }
        else{
            view.backgroundColor = UIColor(red: 255/255, green: 244/255, blue: 209/255, alpha: 1)
        }
    }
    
//    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
//    func changePage(sender: AnyObject) -> () {
//        
//        print("changePage")
//        
//        let x = CGFloat(pageControl.currentPage) * screenScroll.frame.size.width
//        screenScroll.setContentOffset(CGPointMake(x, 0), animated: true)
//    }
//    
//    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        
//        print("scrollViewDidEndDecelerating")
//        
//        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
//        pageControl.currentPage = Int(pageNumber)
//    }
//    
    
    @IBAction func showNextController() {
        print("showNextController")
        
        let forumVc = BCChatViewController()
        
        self.navigationController?.pushViewController(forumVc, animated: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

