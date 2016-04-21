//
//  WACreateQuestionViewController.swift
//  WhereAmI
//
//  Created by Brian Correa on 4/21/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class WACreateQuestionViewController: WAViewController, UITextFieldDelegate {
    
    var image: UIImageView!
    var textFields = Array<UITextField>()

    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.blueColor()
        
        var padding = CGFloat(60)
        var y = CGFloat(64)
        var dimension = frame.size.width-2*padding
        
        self.image = UIImageView(frame: CGRect(x: padding, y: y, width: dimension, height: dimension))
        self.image.backgroundColor = UIColor.redColor()
        view.addSubview(self.image)
        
        let btnSelectImage = UIButton(frame: CGRect(x: padding, y: y, width: dimension, height: 44))
        btnSelectImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        btnSelectImage.setTitle("Tap to Select Image", forState: .Normal)
        view.addSubview(btnSelectImage)
        
        y += self.image.frame.size.height+24
        
        padding = 20
        let width = frame.size.width-2*padding
        
        for i in 0..<4 {
            let textField = UITextField(frame: CGRect(x: padding, y: y, width: width, height: 32))
            textField.delegate = self
            textField.borderStyle = .RoundedRect
            textField.placeholder = (i==0) ? "Correct Answer" : "Option \(i+1)" //to set each indiviually use hash table
            textField.returnKeyType = (i==3) ? .Done : .Next
            view.addSubview(textField)
            self.textFields.append(textField)
            y += textField.frame.size.height+16
        }
        
        dimension = 0.5 * (frame.size.width-(3*padding))
        y = frame.size.height-44-padding
        
        let btnCancel = UIButton(frame: CGRect(x: padding, y: y, width: dimension, height: 44))
        btnCancel.backgroundColor = UIColor.redColor()
        btnCancel.addTarget(self, action: #selector(WACreateQuestionViewController.cancel(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btnCancel)
        
        let btnCreate = UIButton(frame: CGRect(x: frame.size.width-dimension-padding, y: y, width: dimension, height: 44))
        btnCreate.backgroundColor = UIColor.greenColor()
        view.addSubview(btnCreate)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WACreateQuestionViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func dismissKeyboard(sender: UITapGestureRecognizer?){
        for textField in self.textFields {
            if(textField.isFirstResponder()){
                textField.resignFirstResponder() //make keyboard go away
                self.shiftView(0)
                break
            }
        }
    }
    
    func cancel(btn: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let index = self.textFields.indexOf(textField)!
        
        if(index == self.textFields.count-1){ //last one, ignore(for now)
            self.dismissKeyboard(nil)
            return true
        }
        
        let nextTextField = self.textFields[index+1]
        nextTextField.becomeFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
//        let index = self.textFields.indexOf(textField)!
//        print("textFieldShouldBeginEditing: \(index)")
//        
//        if(index == 0){
//            return true
//        }
        
        //shift view up:
        
        shiftView(-150)
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
