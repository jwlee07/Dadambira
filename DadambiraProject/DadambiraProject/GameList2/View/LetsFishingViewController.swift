//
//  LetsFishing.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import MapKit

class LetsFishingViewController: UIViewController {
    
    // MARK: Properties
    var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    private let locationManager = CLLocationManager()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViewComponents()
        
        locationManager.delegate = self
        checkAuthorizationStatus()
        mapView.showsUserLocation = true
        mapView.mapType = .satellite
        
        
        
        // Set initial location in Honolulu
//        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        mapView.centerToLocation (initialLocation)
        
        
        
        // Show artwork on map
        let seoul = Artwork(
            title: "Seoul",
            locationName: "Dook Sum",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 37.528465, longitude: 127.068270))
        mapView.addAnnotation(seoul)
        
        
        let incheon = Artwork(
            title: "Incheon",
            locationName: "Incheon Airport",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 37.489820, longitude: 126.405116))
        mapView.addAnnotation(incheon)
        
        
        let california = Artwork(
            title: "California",
            locationName: "Shoreline Lake Park",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 37.432866, longitude: -122.088072))
        mapView.addAnnotation(california)
        
        
        
        // Delegate
        mapView.delegate = self
    }
    
    
    // MARK: Helpers
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied: break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        @unknown default: fatalError()
        }
    }
    
    private func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse,
            CLLocationManager.locationServicesEnabled()
            else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0
        locationManager.startUpdatingLocation()
    }
    
    
    
    // MARK: Configure
    func configure() {
        
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        view.backgroundColor = .systemBackground
        title = "Lets Fishing"
        
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


private extension MKMapView {
    // Extension 뷰 줌
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}


extension LetsFishingViewController: MKMapViewDelegate {
    // 1
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Artwork else {
            return nil
        }
        // 3
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let artwork = view.annotation as? Artwork else {return}
        //    let launchOptions = [
        //      MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        //    ]
        let dookSumVC = DookSumViewController()
        let incheonAirportVC = IncheonAirportViewController()
        let googleVC = GoogleViewController()
        switch artwork.title {
        case "Seoul":
            navigationController?.pushViewController(dookSumVC, animated: true)
        case "Incheon":
            navigationController?.pushViewController(incheonAirportVC, animated: true)
        case "California":
            navigationController?.pushViewController(googleVC, animated: true)
        default:
            break
        }
        //    artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}

// 내 위치
extension LetsFishingViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let current = locations.last!
      
      if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
        let coordinate = current.coordinate
        
        let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
      }
    }
}
