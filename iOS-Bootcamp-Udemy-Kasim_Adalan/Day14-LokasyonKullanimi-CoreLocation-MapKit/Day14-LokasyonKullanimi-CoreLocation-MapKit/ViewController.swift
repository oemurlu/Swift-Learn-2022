//
//  ViewController.swift
//  Day14-LokasyonKullanimi-CoreLocation-MapKit
//
//  Created by Osman Emre Ömürlü on 2.11.2023.
//

import UIKit
import CoreLocation
import MapKit

// Mapkit icin framework ekledik + sign & capabilities kismindan maps ekledik.

class ViewController: UIViewController {

    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //hassasiyet ayari
        locationManager.requestWhenInUseAuthorization() // izin alma islemi. (Info.plist'e de ekledik.)
        locationManager.startUpdatingLocation() // location almaya baslama islemi
        
        locationManager.delegate = self // protocool icin
    }
}

extension ViewController: CLLocationManagerDelegate {
    // didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count - 1] // locations arrayinin son indexini alalim.
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        
        labelEnlem.text = "Enlem: \(enlem)"
        labelBoylam.text = "Boylam: \(boylam)"
        labelHiz.text = "Hiz: \(sonKonum.speed)"
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) //span: zoom miktari
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        
        /*
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "\(enlem) - \(boylam)"
        pin.subtitle = "KONUM"
        mapView.addAnnotation(pin)
         */
        
        mapView.showsUserLocation = true
    }
}

