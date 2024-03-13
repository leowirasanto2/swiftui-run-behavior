//
//  LocationPermission.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI
import CoreLocation
import Foundation

class LocationPermission:NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var authorizationStatus : CLAuthorizationStatus = .notDetermined
    private let locationManager = CLLocationManager()
    @Published var cordinates : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func requestLocationPermission()  {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        cordinates = location.coordinate
    }
}
