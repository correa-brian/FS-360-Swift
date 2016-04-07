//
//  BCForumViewController.swift
//  celebrities
//
//  Created by Brian Correa on 4/6/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCForumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIScrollViewDelegate {
    

    //MARK: - Properties
    
    var chatTable: UITableView!
    var selectedCelebrity: BCCelebrity!
    var chatField: UITextField!
    
    //MARK: - My Stuff
    
    func configureCell(cell: BCTableViewCell, indexPath: NSIndexPath){
        let comment = self.selectedCelebrity.comments[indexPath.row]
        cell.textLabel?.text = comment.text
        cell.detailTextLabel?.text = comment.timestamp.description
        cell.imageView?.image = UIImage(named: self.selectedCelebrity.image)
    }
    
    //MARK: - Lifecycle Methods
    
    override func loadView() {
        self.title = self.selectedCelebrity.name
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        
        self.chatTable = UITableView(frame: frame, style: .Plain)
        self.chatTable.delegate = self
        self.chatTable.dataSource = self
        //UITableViewSeparatorStyle.none for the below
        self.chatTable.separatorStyle = .None
        
        let width = frame.size.width
        let chatBox = UIView(frame: CGRect(x: 0, y:0, width: width, height: 64))
        chatBox.backgroundColor = UIColor.yellowColor()
        
        self.chatField = UITextField(frame: CGRect(x: 10, y: 10, width: width-20, height: 44))
        self.chatField.delegate = self
        self.chatField.borderStyle = .RoundedRect
        chatBox.addSubview(self.chatField)
        
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
        
        let cmt = BCComment()
        cmt.text = comment!
        
        self.selectedCelebrity.comments.append(cmt)
        self.chatTable.reloadData()
        textField.text = nil
        
        return true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
        self.chatField.resignFirstResponder()
    }
    
    //MARK: - DataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedCelebrity.comments.count //allocate number rows for the table view
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        // Resuse cell
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? BCTableViewCell {
            self.configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        // Create new cell:
        print("Create new cell")
        let cell = BCTableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 88
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
//        let comment = self.commentsArray[indexPath.row]
//        print("didDeselectRowAtIndexPath: \(comment)")
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
