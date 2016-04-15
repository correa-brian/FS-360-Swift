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
    
    //MARK: Properties
    
    var itemsTable: UITableView!
    var itemsArray = Array<IGItem>()
    
    //MARK: Lifecycle Methods
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        
        
        self.itemsTable = UITableView(frame: frame, style: .Plain)
        self.itemsTable.dataSource = self
        self.itemsTable.delegate = self
        
//        self.captionTable.autoresizingMask = .FlexibleTopMargin
        
        view.addSubview(self.itemsTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://www.instagram.com/kobebryant/media/"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
//                print("\(JSON)")
                
                if let items = JSON["items"] as? Array<Dictionary<String, AnyObject>>{
//                    print("\(items)")
                
                    for itemInfo in items {
//                        print("ITEM---------\(itemInfo)")
                        
                        let item = IGItem()
                        item.populate(itemInfo)
                        //Key Value Observation (kvo)
                        self.itemsArray.append(item)
                    }
                    
                    self.itemsTable.reloadData()
                }
            }
        }
        
    }
    
    //MARK: Callback (Observation) Method
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if (keyPath == "image"){
//            print("IMAGE DOWNLOADED")
            
            dispatch_async(dispatch_get_main_queue(), {
                self.itemsTable.reloadData()
            })
            
        }
    }
    
    //MARK: Table Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.itemsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? BCTableViewCell {
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        let cell = BCTableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        let captionInfo = self.itemsArray[indexPath.row]
//        
//        let capText = NSString(string: captionInfo.captionText)
//        
//        let rect = capText.boundingRectWithSize(CGSizeMake(tableView.frame.size.width, 100),
//                                                    options: .UsesLineFragmentOrigin,
//                                                    attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)],
//                                                    context: nil)
//        
//        if(rect.size.height < 44){
//            return 100
//        }
//        
//        return rect.size.height+80
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let item = self.itemsArray[indexPath.row]
        
        let imageVC = IGImageViewController()
        imageVC.post = item
        self.navigationController?.pushViewController(imageVC, animated: true)
        
    }
    
    //MARK: Configure Cell
    
    func configureCell(cell: BCTableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = self.itemsArray[indexPath.row]
        
        cell.textLabel?.text = item.caption
        
        if (item.image == nil){
            item.addObserver(self, forKeyPath: "image", options: .Initial, context: nil)
            cell.imageView?.image = nil
            cell.detailTextLabel?.text = "Comments: \(item.count)"
            item.fetchImage()
            return cell
        }
        
        cell.imageView?.image = item.image
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
