//
//  BCChatViewController.swift
//  disgraced-athletes
//
//  Created by Brian Correa on 4/8/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIScrollViewDelegate {
    
    //MARK: - Properties
    
    var chatField: UITextField!
    var chatTable: UITableView!
    var selectedAthlete: BCAthlete!
    
    //MARK: - My Functions
    
    func configureCell(cell: BCTableViewCell, indexPath: NSIndexPath){
        
        let commentText = self.selectedAthlete.comments[indexPath.row]
        let rect = commentText.text.boundingRectWithSize(CGSizeMake(self.chatTable.frame.size.width-100, 150),
                                                    options: .UsesLineFragmentOrigin,
                                                    attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)],
                                                    context: nil)
        
        cell.resizeCell(rect.size.height)
        cell.commentText.text = commentText.text
        cell.timeStamplabel.text = commentText.timestamp.description
        cell.icon.image = UIImage(named: self.selectedAthlete.image)
        
    }
    
    //MARK: Lifecycle Methods
    
    override func loadView() {
        
        self.title = self.selectedAthlete.name
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.chatTable = UITableView(frame: frame, style: .Plain)
        self.chatTable.delegate = self
        self.chatTable.dataSource = self
        self.chatTable.separatorStyle = .None
        
        
        let width = frame.size.width
        let chatBox = UIView(frame: CGRect(x: 0, y: 0, width: width, height:64))
        chatBox.backgroundColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 0.75)
        
        self.chatField = UITextField(frame: CGRect(x: 10, y: 10, width: width-20, height: 44))
        self.chatField.delegate = self
        self.chatField.borderStyle = .RoundedRect
        chatBox.addSubview(self.chatField)
        
        self.chatTable.tableHeaderView = chatBox
        
        view.addSubview(self.chatTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - DataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return 20
        return self.selectedAthlete.comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        //display position cell.textLabel?.text = "\(indexPath.row)"
        
        //Reuse Cell
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? BCTableViewCell {
            self.configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        //Create New Cell
        print("Create new cell: \(indexPath.row)")
        
        let cell = BCTableViewCell(style: .Subtitle, reuseIdentifier: cellId)
          self.configureCell(cell, indexPath: indexPath)
        return cell
        
    }

    
    //MARK: - Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        let comment = textField.text
        
        if (comment?.characters.count == 0){
            let alert = UIAlertController(title: "Whoops", message: "Comment Can't Be Empty", preferredStyle: .Alert)
            
            let okBtn = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(okBtn)
            
            self.presentViewController(alert, animated: true, completion: nil)
            return true
        }
        
        let cmt = BCComment()
        cmt.text = comment!
        
        self.selectedAthlete.comments.append(cmt)
        self.chatTable.reloadData()
        textField.text = nil
        
        return true
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
        self.chatField.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let comment = self.selectedAthlete.comments[indexPath.row]
        let commentText = NSString(string: comment.text)
        
        let rect = commentText.boundingRectWithSize(CGSizeMake(tableView.frame.size.width-100, 150),
                                                    options: .UsesLineFragmentOrigin,
                                                    attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)],
                                                    context: nil)
        
        // TODO: resize the commentText ourself
        

        print("Height: \(rect.size.height)")
        
        if(rect.size.height < 44){
            return 100
        }
        
        return rect.size.height+80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
