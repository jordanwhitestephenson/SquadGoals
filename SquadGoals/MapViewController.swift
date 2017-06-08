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
import GooglePlacePicker
import Mapbox


class MapViewController: UIViewController, MGLMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MGLMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let locationManager = CLLocationManager()
        let url = URL(string: "mapbox://styles/mapbox/streets-v10")
        let point = MGLPointAnnotation()
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        super.viewDidLoad()
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
      
 
    }
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        let mapView = MGLMapView(frame: view.bounds)
        mapView.userTrackingMode = .follow
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        mapView.setCenter(center, zoomLevel: 15, animated: true)
        view.addSubview(mapView)
      
    }
    func  locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print ("Errors:" + error.localizedDescription)
    }
  
}

 
