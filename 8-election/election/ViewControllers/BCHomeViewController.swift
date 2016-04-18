//
//  BCHomeViewController.swift
//  election
//
//  Created by Brian Correa on 4/11/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class BCHomeViewController: BCViewController, UITableViewDelegate, UITableViewDataSource {
    
    var candidatesTable: UITableView!
    var candidatesArray = Array<Dictionary<String, AnyObject>>()
    
    //MARK: Lifecycle Methods
    
    override func loadView() {
     
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)

        self.candidatesTable = UITableView(frame: frame, style: .Plain)
        self.candidatesTable.dataSource = self
        self.candidatesTable.delegate = self
        self.candidatesTable.autoresizingMask = .FlexibleHeight
        
        view.addSubview(self.candidatesTable)
        
        self.view = view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://dk-election-2016.herokuapp.com/api/profile"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
        
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                print("\(JSON)")
                
                if let profiles = JSON["profiles"] as? Array<Dictionary<String, AnyObject>> {
                    self.candidatesArray = profiles
                    self.candidatesTable.reloadData()
                }
            }
        }
        
        
    }
    
    //MARK: - Tableview Stuff
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.candidatesArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let profile = self.candidatesArray[indexPath.row]
        
        let cellId = "cellId"
        //Reuse Cell
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = profile["name"] as? String
            cell.detailTextLabel?.text = "\(profile["party"]!), \(profile["state"]!)"
            return cell
        }
        
        //Create new cell
        print("Create new cell")
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = profile["name"] as? String
        //cell.textLabel?.text = "\(profile["name"]!)"
        cell.detailTextLabel?.text = "\(profile["party"]!), \(profile["state"]!)"
        return cell
        
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
