//
//  ViewController.swift
//  disgraced-athletes
//
//  Created by Brian Correa on 4/7/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - My Stuff
    
    @IBOutlet var imageScrollView: UIScrollView!
    @IBOutlet var imageLabel: UILabel!
    
    var imagesArray = ["armstrong.png", "arod.png", "phelps.png"]
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = .None
        
        let w = self.imagesArray.count*Int(self.imageScrollView.frame.size.width)
        
        self.imageScrollView.contentSize = CGSize(width: w, height: 0)
        self.imageScrollView.pagingEnabled = true
        self.imageScrollView.showsHorizontalScrollIndicator = false
        
        self.imageScrollView.delegate = self
        
        for image in self.imagesArray {
            let index = self.imagesArray.indexOf(image)
            let xOrigin = index!*200
            let imageView = UIImageView(frame: CGRect(x: xOrigin, y: 0, width: 200, height: 200))
            imageView.image = UIImage(named: image)
            self.imageScrollView.addSubview(imageView)
        }
        
        self.imageLabel.textColor = UIColor.blackColor()
        self.imageLabel.text = "Lance DopeStrong"
        
        
    }
    
    //MARK: - Callback Function
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        print("scrollViewDidEndDecelerating: \(scrollView.contentOffset.x)")
        
        let offset = scrollView.contentOffset.x
        
        if (offset == 0){
            self.imageLabel.text = "Lance DopeStrong"
        }
        if (offset == 200){
            self.imageLabel.text = "Alex Roidriguez"
        }
        if (offset == 400){
            self.imageLabel.text = "Michael Bong-Phelps"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

