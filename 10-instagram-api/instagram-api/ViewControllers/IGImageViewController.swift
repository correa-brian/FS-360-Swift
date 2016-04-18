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
        
        let caption = UITextView(frame: CGRect(x: 0, y: 276, width: width, height: 30))
        caption.text = post.caption
        caption.textColor = UIColor.whiteColor()
        caption.font = UIFont.systemFontOfSize(14)
        caption.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.postTable.addSubview(caption)
        
        let imageGradient = CAGradientLayer()
        imageGradient.frame = postImageView.bounds
        var colors = [CGColor]()
        colors.append(UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor)
        colors.append(UIColor(red: 0, green: 0, blue: 0, alpha: 0).CGColor)
        
        imageGradient.colors = colors
        imageGradient.startPoint = CGPointMake(0.5, 1)
        imageGradient.endPoint = CGPointMake(0.5, 0.5)
        
        postImageView.layer.addSublayer(imageGradient)
        
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
