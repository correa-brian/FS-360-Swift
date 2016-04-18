//
//  FFMapViewController.swift
//  FoodFinder
//
//  Created by Brian Correa on 4/13/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import MapKit

class FFMapViewController: FFViewController, MKMapViewDelegate {

    //MARK: Properties
    
    var venue: FFVenue!
    var mapView: MKMapView!
    var allVenues: Array<FFVenue>!
    
    //MARK: Lifecycle Methods
    
    override func loadView(){
        self.title = self.venue.name
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.grayColor()
        
        self.mapView = MKMapView(frame: frame)
        let center = CLLocationCoordinate2DMake(self.venue.lat, self.venue.lng)
        self.mapView.centerCoordinate = center
        
        let regionRadius: CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(center, regionRadius, regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
        self.mapView.showsUserLocation = true
//        self.mapView.mapType = .Satellite
        self.mapView.delegate = self
        self.mapView.addAnnotations(self.allVenues)
    
        view.addSubview(self.mapView)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - mapView delegate function

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? FFVenue {
            let identifier = "pin"
            
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as?
                MKPinAnnotationView {
                dequeuedView.annotation = annotation
                dequeuedView.canShowCallout = true
                return dequeuedView
            }
        }
        
        return nil
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
