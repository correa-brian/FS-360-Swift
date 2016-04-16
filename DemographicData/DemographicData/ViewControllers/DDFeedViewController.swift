//
//  DDFeedViewController.swift
//  DemographicData
//
//  Created by Brian Correa on 4/16/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class DDFeedViewController: DemDataViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties & Functions
    var dataTable: UITableView!
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = "\(indexPath.row)"
        
        cell.textLabel?.text = item
        return cell
    }
    
    //MARK: Lifecycle Methods
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.dataTable = UITableView(frame: frame, style: .Plain)
        self.dataTable.delegate = self
        self.dataTable.dataSource = self
        
        self.dataTable.autoresizingMask = .FlexibleTopMargin
        self.dataTable.separatorStyle = .None
        
        view.addSubview(self.dataTable)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://www.broadbandmap.gov/broadbandmap/"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                print("\(JSON)")
            }
        
        }
    }
    
    //MARK: TableView Delegate Methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
