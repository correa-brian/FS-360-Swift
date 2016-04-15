//
//  IGImageViewController.swift
//  instagram-api
//
//  Created by Brian Correa on 4/14/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class IGImageViewController: IGViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postTable: UITableView!
    var post = IGItem()
    
    override func loadView() {
        
        self.edgesForExtendedLayout = .None
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.grayColor()
        
        self.postTable = UITableView(frame: frame, style: .Plain)
        self.postTable.delegate = self
        self.postTable.dataSource = self
        self.postTable.separatorStyle = .None
        
        let width = frame.size.width

        let postImageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: 320))
        postImageView.image = post.image
        
        self.postTable.tableHeaderView = postImageView
        
        view.addSubview(postTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Mark: Table Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
        
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        cell.textLabel?.text = self.post.comments[indexPath.row]
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
