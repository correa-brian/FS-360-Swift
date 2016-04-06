//
//  BCForumViewController.swift
//  celebrities
//
//  Created by Brian Correa on 4/6/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCForumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var chatTable: UITableView!
    
    override func loadView() {
        
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        
        self.chatTable = UITableView(frame: frame, style: .Plain)
        
        self.chatTable.delegate = self
        self.chatTable.dataSource = self
        view.addSubview(self.chatTable)
        
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - DataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 //allocate 20 rows for the table view
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        
        // Resuse cell
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        
        // Create new cell:
        
        print("Create new cell")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
