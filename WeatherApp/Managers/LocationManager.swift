//
//  LocationManager.swift
//  WeatherApp
//
//  Created by L M on 23/09/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager() // Framework a koordinátákhoz
    
    @Published var location: CLLocationCoordinate2D? //opcionális, ha nincs user access
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self //delegate -> CLLocM. instanciához
    }

    func requestLocation() { //egyszeri user loc. lekérdezés
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //location koordináták
        location = locations.first?.coordinate
        isLoading = false
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) { //error handling
        print("Error getting the location", error)
        isLoading = false
    }
}

