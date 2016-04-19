//
//  ViewController.swift
//  image-picker
//
//  Created by Brian Correa on 4/19/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    
    var imagePicker: UIImagePickerController!
    @IBOutlet var selectedImageView: UIImageView!
    
    @IBAction func takePicture(){
        print("takePicture")
        
        let actionSheet = UIActionSheet(title: "Select Source", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Camera", "Photo Library")
        
        
        actionSheet.frame = CGRectMake(0, 150, self.view.frame.size.width, 100)
        actionSheet.actionSheetStyle = .BlackOpaque
        actionSheet.showInView(UIApplication.sharedApplication().keyWindow!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: ActionSheet Delegate

    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        print("clickedButtonAtIndex: \(buttonIndex)")
        
        var sourceType: UIImagePickerControllerSourceType
        
        if (buttonIndex == 1) {
            sourceType = .Camera
        }
        else if (buttonIndex == 2){
            sourceType = .PhotoLibrary
        }
        else {
            return
        }
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker.sourceType = sourceType
        self.imagePicker.delegate = self
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    
    //MARK: ImagePickerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
//        print("didFinishPickingMediaWithInfo: \(info)")
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("didFinishPickingMediaWithInfo: \(selectedImage)")
            
            self.selectedImageView.image = selectedImage
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        print("imagePickerControllerDidCancel")
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

