//
//  IGFeedViewController.swift
//  instagram-api
//
//  Created by Brian Correa on 4/13/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class IGFeedViewController: IGViewController, UITableViewDelegate, UITableViewDataSource {
    
    var captionTable: UITableView!
    var captionsArray = Array<IGCaption>()
    
    //MARK - Lifecycle Methods
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        
        
        self.captionTable = UITableView(frame: frame, style: .Plain)
        self.captionTable.dataSource = self
        self.captionTable.delegate = self
        
        self.captionTable.autoresizingMask = .FlexibleTopMargin
        self.captionTable.separatorStyle = .None
        
        view.addSubview(self.captionTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://www.instagram.com/therock/media/"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
//                print("\(JSON)")
                
                if let resp = JSON["items"] as? Array<Dictionary<String, AnyObject>>{
//                    print("\(resp)")
                
                    for itemInfo in resp {
//                        print("ITEM---------\(itemInfo)")
                        
                        let caption = IGCaption()
                        caption.populate(itemInfo)
                        self.captionsArray.append(caption)
                    }
                    self.captionTable.reloadData()
                }
            }
        }
        
    }
    
    //MARK: Table Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.captionsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
    }
    
    //MARK: Configure Cell
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let caption = self.captionsArray[indexPath.row]
        
        cell.textLabel?.text = caption.captionText
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
