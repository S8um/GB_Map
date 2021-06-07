//
//  ViewController.swift
//  GB_Map
//
//  Created by admin on 03.06.2021.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager: CLLocationManager?
    
    var coordinate = CLLocationCoordinate2D(latitude: 37.75354497, longitude: -122.40284292)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureMap()
        configureLocationManager()
    }
    
    func configureMap() {
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 17)
        mapView.camera = camera
        mapView.isTrafficEnabled = true
    }
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
    }
    
    func addMarker(position: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: position)
        marker.map = mapView
    }
    
    @IBAction func currentLocation(_ sender: Any) {
        locationManager?.requestLocation()
        
        guard let myCoordinate = locationManager?.location?.coordinate else {
            return
        }
        mapView.animate(toLocation: myCoordinate)
        mapView.animate(toZoom: 17)
    }

    @IBAction func updateLocation(_ sender: Any) {
        locationManager?.startUpdatingLocation()
    }

}

//MARK: - Extension
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first as Any)
        
        let geocoder = CLGeocoder()
        
        guard let location = locations.last else { return }
        geocoder.reverseGeocodeLocation(location) { places, error in
            print(places?.first as Any)
        }
        
        let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 17)
        mapView.animate(to: camera)
        addMarker(position: location.coordinate)

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
