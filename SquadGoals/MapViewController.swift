//
//  MapViewController.swift
//  
//
//  Created by Jordan Stephenson on 6/4/17.
//
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces
import FirebaseDatabase
import Firebase

class MapViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate
    
{
 
    @IBOutlet weak var myView: GMSMapView!

   
    
    var myLocation: CLLocationCoordinate2D!
    let locationManager = CLLocationManager()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }




    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        let location = locations[0]
        myLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        myView.camera = GMSCameraPosition(target: myLocation, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
        let marker = GMSMarker()
        marker.position = myView.camera.target
        marker.snippet = "Current Location"
        marker.map = myView
        
        
    }

    

}
