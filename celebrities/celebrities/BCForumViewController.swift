//
//  BCForumViewController.swift
//  celebrities
//
//  Created by Brian Correa on 4/6/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCForumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    

    //MARK: - Properties
    
    var chatTable: UITableView!
    var commentsArray = Array<String>()
    
    //MARK: - Lifecycle Methods
    
    override func loadView() {
        self.commentsArray.append("Hey")
        self.commentsArray.append("Hungry")
        self.commentsArray.append("Check out my mySpace")
        
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        
        self.chatTable = UITableView(frame: frame, style: .Plain)
        
        self.chatTable.delegate = self
        self.chatTable.dataSource = self
        
        
        let width = frame.size.width
        let chatBox = UIView(frame: CGRect(x: 0, y:0, width: width, height: 64))
        chatBox.backgroundColor = UIColor.yellowColor()
        
        let chatField = UITextField(frame: CGRect(x: 10, y: 10, width: width-20, height: 44))
        chatField.delegate = self
        chatField.borderStyle = .RoundedRect
        chatBox.addSubview(chatField)
        
        self.chatTable.tableHeaderView = chatBox
        
        view.addSubview(self.chatTable)
     
        
        self.view = view
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let comment = textField.text
        if(comment?.characters.count == 0){
            let alert = UIAlertController(title: "Uh Oh!", message: "That's not a comment :(", preferredStyle: .Alert)
            
            let okBtn = UIAlertAction(title: "Sure", style: .Default, handler: nil)
            alert.addAction(okBtn)
            
            self.presentViewController(alert, animated: true, completion: nil)
            return true
        }
        
        self.commentsArray.append(comment!)
        self.chatTable.reloadData()
        textField.text = nil
        
        return true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - DataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsArray.count //allocate number rows for the table view
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let comment = self.commentsArray[indexPath.row]
        
        let cellId = "cellId"
        
        // Resuse cell
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = comment
            return cell
        }
        
        // Create new cell:
        print("Create new cell")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = comment
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
