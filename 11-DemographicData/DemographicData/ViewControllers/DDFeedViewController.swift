//
//  DDFeedViewController.swift
//  DemographicData
//
//  Created by Brian Correa on 4/16/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class DDFeedViewController: DemDataViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    //MARK: Properties & Functions
    var locationManager: CLLocationManager!
    var dataTable: UITableView!
    var areaInfoArray = Array<DDLocation>()
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let area = self.areaInfoArray[indexPath.row]
        
        cell.textLabel?.text = ("The Median Income here is: \(area.medianIncome)")
        cell.detailTextLabel?.text = ("Click to see more stats")
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
        
        self.dataTable.autoresizingMask = .FlexibleHeight
//        self.dataTable.separatorStyle = .None
        
        view.addSubview(self.dataTable)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
    }
    
    //MARK: Location Manager Delegate
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {

        if (status == .AuthorizedWhenInUse){
            print("AuthorizedWhenInuse")
            self.locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        print("didUpdateLocations: \(locations)")
        if (locations.count == 0) {
            return
        }
        
        let loc = locations[0]
        let now = NSDate().timeIntervalSince1970
        let locationTime = loc.timestamp.timeIntervalSince1970
        let delta = now-locationTime
        
        print("NOW = \(now)")
        print("Location Time = \(locationTime)")
        print("DELTA = \(delta)")
        
        if (delta > 10){
            return
        }
        
        if(loc.horizontalAccuracy > 100){
            return
        }
        
        self.locationManager.stopUpdatingLocation()
        print("Found Current Location: \(loc.description)")
        
        let lat = "\(loc.coordinate.latitude)"
        let lng = "\(loc.coordinate.longitude)"
        
        let url = "http://www.broadbandmap.gov/broadbandmap/demographic/2014/coordinates?latitude=\(lat)&longitude=\(lng)&format=json"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                print("\(JSON)")
                
                if let results = JSON["Results"] as? Dictionary<String, AnyObject>{
//                    print("(\(results)")
                    
                    let area = DDLocation()
                    area.populate(results)
                    self.areaInfoArray.append(area)
                }
                self.dataTable.reloadData()
            }
                    
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let area = self.areaInfoArray[indexPath.row]
        print("\(area.medianIncome)")
        
    }
    
    //MARK: TableView Delegate Methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.areaInfoArray.count
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
