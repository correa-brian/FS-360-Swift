//
//  FFVenuesViewController.swift
//  FoodFinder
//
//  Created by Brian Correa on 4/12/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class FFVenuesViewController: FFViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    //MARK: - Properties
    
    var venueTable: UITableView!
    var locationManager: CLLocationManager!
    
    //var venuesArray = Array<Dictionary<String, AnyObject>>() - changes to line below
    var venuesArray = Array<FFVenue>()
    
    
    //MARK: - Lifecycle Methods
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view  = UIView(frame: frame)
        view.backgroundColor = UIColor.grayColor()
        
        self.venueTable = UITableView(frame: frame, style: .Plain)
        self.venueTable.dataSource = self
        self.venueTable.delegate = self
        self.venueTable.autoresizingMask = .FlexibleHeight
        self.venueTable.separatorStyle = .None
        
        view.addSubview(self.venueTable)
        
        
        self.view = view
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
    }
    
    //MARK: - LocationManager Delegate
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus){
        
        if (status == .AuthorizedWhenInUse){ //user said 'YES'
            print("Authorized When In Use")
            self.locationManager.startUpdatingLocation()
        }
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("didUpdateLocations: \(locations)")
        if(locations.count == 0){
            return
        }
        
        let loc = locations[0]
        let now = NSDate().timeIntervalSince1970
        let locationTime = loc.timestamp.timeIntervalSince1970
        let delta = now-locationTime
        
        print("NOW = \(now)")
        print("Location Time = \(locationTime)")
        print("DELTA = \(delta)")
        
        if (delta > 10){ //cached data, ignore
            return
        }
        
        if(loc.horizontalAccuracy > 100){ //not accuate enough
            return
        }
        
        self.locationManager.stopUpdatingLocation()
        print("Found Current Location: \(loc.description)")
        
        let latLng = "\(loc.coordinate.latitude),\(loc.coordinate.longitude)"
        
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latLng)&radius=500&types=food&key=AIzaSyDwqhx_8j5_4XbIOAVRpxkZmDfMVMzIwuE"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                
                                print("\(JSON)")
                
                if let results = JSON["results"] as? Array<Dictionary<String, AnyObject>>{
                    
                    //for venue in results { - changes to
                    for venueInfo in results {
                        
                        //eventually more logic will be here
                        
                        let venue = FFVenue()
//                        self.venuesArray.append(venue) -- changes to
                        venue.populate(venueInfo)
                        
//                        self.venuesArray.append(venueInfo) -- changes to
                        
                        self.venuesArray.append(venue)
                        
                    }
                    
                    self.venueTable.reloadData()
                    
                }
                
            }
        }
        
        
    }
    
    //MARK: - Delegate Table Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.venuesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        //Reuse Cell
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        //Create new cell
        //        print("Create new cell: \(indexPath.row)")
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
    }
    
    //MARK: - Configure Cell
    
    func configureCell(cell: UITableViewCell, indexPath:NSIndexPath) -> UITableViewCell {
        
        let venue = self.venuesArray[indexPath.row]
        
        //changed from venue["name] as? String
        cell.textLabel?.text = venue.name
        cell.detailTextLabel?.text = ("\(venue.address), \(venue.rating) stars")
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
