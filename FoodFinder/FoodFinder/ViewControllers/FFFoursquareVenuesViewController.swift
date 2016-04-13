//
//  FFFoursquareVenuesViewController.swift
//  FoodFinder
//
//  Created by Brian Correa on 4/12/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class FFFoursquareVenuesViewController: FFViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    //MARK: - Properties
    
    var venueTable: UITableView!
    var locationManager: CLLocationManager!
    var venuesArray = Array<FFVenue>()

    //MARK: - Lifecycle Methods
    
    override func loadView(){
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.grayColor()
        
        self.venueTable = UITableView(frame: frame, style: .Plain)
        self.venueTable.dataSource = self
        self.venueTable.delegate = self
        
        self.venueTable.autoresizingMask = .FlexibleTopMargin
        self.venueTable.separatorStyle = .None
        
        view.addSubview(self.venueTable)
        
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        
    }
    
    //MARK: - LocationManager Delegate
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == .AuthorizedWhenInUse){ //user said "YES"
            print("AuthorizedWhenInUse")
            self.locationManager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("didUpdateLocations: \(locations)")
        if(locations.count == 0) {
            return
        }
        
        let loc = locations[0]
        let now = NSDate().timeIntervalSince1970
        let locationTime = loc.timestamp.timeIntervalSince1970
        let delta = now-locationTime
        
        print("NOW = \(now)")
        print("Location Time = \(locationTime)")
        print("DELTA = \(delta)")
        
        
        if (delta > 10){ //not accurate enough
            return
        }
        
        if(loc.horizontalAccuracy > 100){ //not accuate enough
            return
        }
        
        self.locationManager.stopUpdatingLocation()
        print("Found Current Location: \(loc.description)")
        
        let latLng = "\(loc.coordinate.latitude),\(loc.coordinate.longitude)"
        
        let url = "https://api.foursquare.com/v2/venues/search?v=20140806&ll=\(latLng)&client_id=VZZ1EUDOT0JYITGFDKVVMCLYHB3NURAYK3OHB5SK5N453NFD&client_secret=UAA15MIFIWVKZQRH22KPSYVWREIF2EMMH0GQ0ZKIQZC322NZ"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
        
//                    print("\(JSON)")
                
                if let resp = JSON["response"] as? Dictionary<String, AnyObject> {
                    
//                    print("\(resp)")

                    if let venues = resp["venues"] as? Array<Dictionary<String, AnyObject>>{
                 
//                        print("\(venues)")
                        for venueInfo in venues {
//                            print("VENUE-----------\(venueInfo)")
                            let venue = FFVenue()
                            venue.populate(venueInfo)
                            self.venuesArray.append(venue)
                        }
                        self.venueTable.reloadData()
                    }


                }
            }
        }
    }

    //MARK: - Table Delegate Methods
    
    func tableView(tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venuesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellId = "cellId"
        //let venue = self.venuesArray[indexPath.row]
        
        //Reuse Cell
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        //Create new cell
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
        
    }
    
    func configureCell(cell: UITableViewCell, indexPath:NSIndexPath) -> UITableViewCell {
        let venue = self.venuesArray[indexPath.row]
        
        //changed from venue["name] as? String
        cell.textLabel?.text = venue.name
        cell.detailTextLabel?.text = venue.address
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
