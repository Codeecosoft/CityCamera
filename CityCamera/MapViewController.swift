//
//  CurrentLocationViewController.swift
//  MyLocations
//
//  Created by M.I. Hollemans on 06/08/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
    @IBOutlet weak var addressT: UITextField!
    @IBOutlet weak var mapView: MKMapView!
   
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var lastLocationError: NSError?
    
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: NSError?
    
    
    func getLocation() {
        let authStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if authStatus == .Denied || authStatus == .Restricted {
            servicesDeniedAlert()
            return
        }
        
        location = nil
        lastLocationError = nil
        placemark = nil
        lastGeocodingError = nil
        
        startLocationManager()
        updateAddress()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        
        addressT.delegate = self
        
        addressT.addTarget(self, action: "addressChanged", forControlEvents: UIControlEvents.TouchDown)
    }

    
    func servicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled",
            message: "Please enable location services for this app in Settings.",
            preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(okAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
           
        }
    }
    
  
    
    func stopLocationManager() {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
    }
    
    func updateAddress() {
            
        if let placemark = placemark {
                addressT.text = stringFromPlacemark(placemark)
        } else {
                addressT.text = "Searching..."
        }
            
       
    }
    
    func stringFromPlacemark(placemark: CLPlacemark) -> String {
        var line1 = ""
        
        
        if let s = placemark.thoroughfare {
            line1 += s + " "
        }
        
        if let s = placemark.subThoroughfare {
            line1 += s + " "
        }
        
        
        if let s = placemark.locality {
            line1 += s + " "
        }

        
        return line1
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!

        print("didUpdateLocations \(newLocation)")
        
        if !performingReverseGeocoding {
            print("*** Going to geocode")
            
            performingReverseGeocoding = true
            
            geocoder.reverseGeocodeLocation(newLocation, completionHandler: {
                placemarks, error in
                
                //print("*** Found placemarks: \(placemarks), error: \(error)")
                
                self.lastGeocodingError = error
                if error == nil, let p = placemarks where !p.isEmpty {
                    self.placemark = p.last!
                } else {
                    self.placemark = nil
                }
                
                self.performingReverseGeocoding = false
                self.updateAddress()
                
                
                //map
                let span = MKCoordinateSpanMake(0.001, 0.001)
                let center = CLLocationCoordinate2D(latitude: newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude)
                let region = MKCoordinateRegion(center: center,span: span )
                
                self.mapView.setRegion(region, animated: true)
                
                
                let objectAnnotation = MKPointAnnotation()
                objectAnnotation.coordinate = center
                
                
                self.mapView.removeAnnotations(self.mapView.annotations)
                self.mapView.addAnnotation(objectAnnotation)
            })
        }
        

    }
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
     func addressChanged() {
        stopLocationManager()
    }
}
