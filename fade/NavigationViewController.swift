//
//  NavigationViewController.swift
//  fade
//
//  Created by Ishan Gupta on 8/3/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//




import UIKit
import GoogleMaps
import CoreLocation

class NavigationViewController: UIViewController, CLLocationManagerDelegate{
    
    var mapView: GMSMapView?
    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
      //  let latty: [Double] = [37.733237]
        
        
        
        GMSServices.provideAPIKey("AIzaSyDVDdpDj2xyZ0-yTBQZgWf1_aV2XJHNgt8")
        
        
        // Independent from a marker
       let camera = GMSCameraPosition.cameraWithLatitude(37.733237, longitude: -122.503009, zoom: 12)
       mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
       view = mapView
  
        
        let currentLocation = CLLocationCoordinate2DMake(37.733237, -122.503009)
        let marker = GMSMarker(position: currentLocation)
        marker.icon = GMSMarker.markerImageWithColor(UIColor.blackColor())
        marker.title = "Fade Cuts"
         marker.snippet = "Fresh cuts"
        marker.map = mapView
        
        
        
        let  sanjoseMarker = CLLocationCoordinate2DMake(37.3351874, -121.88107150000002)
        let marker2 = GMSMarker(position: sanjoseMarker)
        marker.icon = GMSMarker.markerImageWithColor(UIColor.blackColor())
        marker.title = "Rasputin Cuts"
        marker.map = mapView
        
        
      
        
        
        
        
      mapView!.settings.myLocationButton = true
        mapView!.settings.compassButton = true
        
        
     // End of VIEW DID LOAD
        
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView!.myLocationEnabled = true
        }
    }
    
    
//     func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject]) {
//        if !didFindMyLocation {
//            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as! CLLocation
//            mapView!.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 17.0)
//            mapView!.settings.myLocationButton = true
//            
//            didFindMyLocation = true
//        }
//    }
    
    
    
}




