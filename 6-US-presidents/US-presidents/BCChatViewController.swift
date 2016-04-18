//
//  BCChatViewController.swift
//  US-presidents
//
//  Created by Brian Correa on 4/6/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    //MARK: - Properties
    
    var chatTable: UITableView!
    var commentsArray = Array<String>()
    
    //MARK: - Lifecycle Methods
    
    override func loadView(){
        
        self.commentsArray.append("First")
        self.commentsArray.append("I love presidents")
        self.commentsArray.append("Vote for me")
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        
        view.backgroundColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 1)
        
        self.chatTable = UITableView(frame: frame, style: .Plain)
        
        self.chatTable.delegate = self
        self.chatTable.dataSource = self
        
        let width = frame.size.width
        let chatBox = UIView(frame: CGRect(x:0, y:0, width: width, height: 64))
        chatBox.backgroundColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 1)
        
        
        let chatField = UITextField(frame: CGRect(x: 10, y:10, width: width-20, height: 44))
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
            let alert = UIAlertController(title: "Try Again", message: "Need a comment", preferredStyle: .Alert)
            
            let okBtn = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(okBtn)
            
            self.presentViewController(alert, animated: true, completion: nil)
            return true
        }
        
        self.commentsArray.append(comment!)
        self.chatTable.reloadData()
        textField.text = nil
        
        return true
    }
    
    //MARK: - DataSource Methods
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return 20 if you just want numbers

        return self.commentsArray.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let comment = self.commentsArray[indexPath.row]
        
        let cellId = "cellId"
        
        
        //To display row numbers use "\(indexPath.row)"
        
        //Reuse Cell
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = comment
            return cell
        }
        
        //Create New Cell
        print("Create new cell")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = comment
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
