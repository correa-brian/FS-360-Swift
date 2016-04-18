//
//  BCChatViewController.swift
//  secret-windows
//
//  Created by Brian Correa on 4/10/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCChatViewController: UIViewController {
    
    var nxtPickerView: UIPickerView!
    
    override func loadView() {
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 209/255, green: 220/255, blue: 255/255, alpha: 1)
        
        let w = frame.size.width
        
//        self.nxtPickerView = UIPickerView(frame: CGRect(x: 0, y: 20, width: w, height: 100))
//        
//        self.nxtPickerView.dataSource = self
//        self.nxtPickerView.delegate = self
//        
//        view.addSubview(self.nxtPickerView)
        
//        self.nxtPickerView.showsSelectionIndicator: true
        
        self.view = view
        
    }
    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        
//        // returns the # of rows in each component..
//
//    }
//        
//    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
//    }
//    
//
//    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//    
//    }
//
//    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//    
//    }

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
