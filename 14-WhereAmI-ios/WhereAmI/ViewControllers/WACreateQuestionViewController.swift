//
//  WACreateQuestionViewController.swift
//  WhereAmI
//
//  Created by Brian Correa on 4/21/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class WACreateQuestionViewController: WAViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    
    var imagePicker: UIImagePickerController!
    var questionImage: UIImageView!
    var textFields = Array<UITextField>()

    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 220/255, alpha: 1)
        
        var padding = CGFloat(60)
        var y = CGFloat(64)
        var dimension = frame.size.width-2*padding
        
        self.questionImage = UIImageView(frame: CGRect(x: padding, y: y, width: dimension, height: dimension))
        self.questionImage.backgroundColor = UIColor(red: 148/255, green: 158/255, blue: 194/255, alpha: 1)
        view.addSubview(self.questionImage)
        
        let btnSelectImage = UIButton(frame: CGRect(x: padding, y: y, width: dimension, height: 44))
        btnSelectImage.backgroundColor = UIColor(red: 152/255, green: 207/25, blue: 166/255, alpha: 0.65)
        btnSelectImage.setTitle("Tap to Select Image", forState: .Normal)
        btnSelectImage.addTarget(self, action: #selector(WACreateQuestionViewController.takePicture(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btnSelectImage)
        
        y += self.questionImage.frame.size.height+24
        
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
        btnCancel.backgroundColor = UIColor(red: 240/255, green: 152/255, blue: 141/255, alpha: 1)
        btnCancel.setTitle("Cancel", forState: .Normal)
        btnCancel.layer.cornerRadius = 5.0
        btnCancel.addTarget(self, action: #selector(WACreateQuestionViewController.cancel(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btnCancel)
        
        let btnCreate = UIButton(frame: CGRect(x: frame.size.width-dimension-padding, y: y, width: dimension, height: 44))
        btnCreate.backgroundColor = UIColor(red: 148/255, green: 158/255, blue: 194/255, alpha: 1)
        btnCreate.setTitle("Add", forState: .Normal)
        btnCreate.layer.cornerRadius = 5.0
        view.addSubview(btnCreate)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WACreateQuestionViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: My Functions
    
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
    
    func takePicture(sender: UIButton){
        print("takePicture")
        
        let actionSheet = UIActionSheet(title: "Select Source", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Camera", "Photo Library")
        
        actionSheet.frame = CGRectMake(0, 150, self.view.frame.size.width, 100)
        actionSheet.actionSheetStyle = .BlackOpaque
        actionSheet.showInView(UIApplication.sharedApplication().keyWindow!)
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
    
    //MARK: ImagePickerDelegate
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("didFinishPickingMediaWithInfo: \(selectedImage)")
            
            self.questionImage.image = selectedImage
            
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        
        print("imagePickerControllerDidCancel")
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: ActionSheet Delegate
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        print("clickedButtonAtIndex: \(buttonIndex)")
        
        var soureType: UIImagePickerControllerSourceType
        
        if(buttonIndex == 1){
            soureType = .Camera
        }
        else if (buttonIndex == 2){
            soureType = .PhotoLibrary
        }
        else {
            return
        }
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker.sourceType = soureType
        self.imagePicker.delegate = self
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
