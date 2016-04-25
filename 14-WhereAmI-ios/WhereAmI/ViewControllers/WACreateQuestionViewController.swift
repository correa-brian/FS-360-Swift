//
//  WACreateQuestionViewController.swift
//  WhereAmI
//
//  Created by Brian Correa on 4/21/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class WACreateQuestionViewController: WAViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    
    var imagePicker: UIImagePickerController!
    var questionImage: UIImageView!
    var textFields = Array<UITextField>()
    var loadingScreen: UIView!
    var spinner: UIActivityIndicatorView!

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
        btnCreate.addTarget(self, action: #selector(WACreateQuestionViewController.createQuestion(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btnCreate)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WACreateQuestionViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        self.loadingScreen = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.loadingScreen.backgroundColor = UIColor.blackColor()
        self.loadingScreen.alpha = 0
        
        view.addSubview(self.loadingScreen)
        
        self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .White)
        self.spinner.center = view.center
        self.spinner.alpha = 0
        view.addSubview(self.spinner)
        
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
    
    func createQuestion(btn: UIButton){
        
        
        if(self.questionImage.image == nil){
            let alert = UIAlertController(title: "Missing Image",
                                          message: "Your forgot to add an image",
                                          preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        self.dismissKeyboard(nil)
        self.loadingScreen.alpha = 0.6
        self.spinner.alpha = 1.0
        self.spinner.startAnimating()
        
        // request upload string from CDN:
        let url = "https://media-service.appspot.com/api/upload"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                
                if let upload = JSON["upload"] as? String {
                    print("\(upload)")
                    let data = UIImageJPEGRepresentation(self.questionImage.image!, 0.5)
                    let pkg = ["name": "image.jpg", "data":data!]
                    self.uploadImage(upload, postData: pkg)
                }
            }
        }
        
    }
    
    func uploadImage(requestURL: String, postData:[String:AnyObject]){
        
        let name = postData["name"] as! String
        let imgData = postData["data"] as? NSData
        
        Alamofire.upload(.POST, requestURL,
                         multipartFormData: { multipartFormData in
                            multipartFormData.appendBodyPart(data: imgData!, name: "file", fileName: name, mimeType: "image/jpeg")
            },
                         encodingCompletion: { encodingResult in
                            print("Completion: \(encodingResult)")
                            switch encodingResult {
                            case .Success(let upload, _, _):
                                upload.responseJSON { response in
                                    print("UPLOAD RESPONSE: \(response)")
                                    if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                                        print("UPLOAD DONE: \(JSON)")
                                        if let imageInfo = JSON["image"] as? Dictionary<String, AnyObject> {
                                            print("\(imageInfo)")
                                            
                                            if let imageId = imageInfo["id"] as? String{
                                                self.submitQuestion(imageId)
                                                
                                            }
                                        }
                                        
                                    }
                                }
                                
                            case .Failure(let encodingError):
                                print("UPLOAD FAIL \(encodingError): ")
                            }
            }
        )
        
    }
    
    func submitQuestion(imageKey: String){
        
//        print("createQuestion: ")
        
        var params = Dictionary<String, AnyObject>()
        params["image"] = imageKey
        var options = Array<String>()
        
        var valid = true
        for i in 0..<self.textFields.count {
            let textField = self.textFields[i]
            let option = textField.text!
            //            print("\(option)")
            
            if(option.characters.count == 0){ //empty field do not continue
                valid = false
                break
            }
            
            if (i == 0){
                params["answer"] = option
            }
            else {
                options.append(option)
            }
            
        }
        
        if(valid == false){
            self.loadingScreen.alpha = 0
            self.spinner.alpha = 0
            self.spinner.stopAnimating()
            print("Cannot Submit Question")
        }
        
        params["options"] = options
        print("Submit Question: \(params)")
        
        let url = "http://localhost:3000/api/question"
        
        Alamofire.request(.POST, url, parameters: params).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                print("\(JSON)")
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.loadingScreen.alpha = 0
                    self.spinner.alpha = 0
                    self.spinner.stopAnimating()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
            }
        }
        
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
        
        if let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
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
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
