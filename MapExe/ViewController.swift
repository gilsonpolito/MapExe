//
//  ViewController.swift
//  MapExe
//
//  Created by pos on 19/10/2018.
//  Copyright © 2018 pos. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLongitude: UITextField!
    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func atualizarMapa(_ sender: Any) {
        let latitude = Double(self.txtLatitude.text!)
        let longitude = Double(self.txtLongitude.text!)
        renderizarMapa(latitude: latitude!, longitude: longitude!)
    }
    
    func renderizarMapa(latitude: Double, longitude: Double) {
        let latitude: CLLocationDegrees = latitude
        let longitude: CLLocationDegrees = longitude
        
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        let theSpan:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let churchLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let theRegion:MKCoordinateRegion = MKCoordinateRegion.init(center:churchLocation, span:theSpan)
        self.mapView.setRegion(theRegion, animated: true)
        
        let theUImMinisterAnnotation = MKPointAnnotation()
        theUImMinisterAnnotation.coordinate = churchLocation
        theUImMinisterAnnotation.title = "Posicao lat: " + String(latitude) + " long: " + String(longitude)
        self.mapView.addAnnotation(theUImMinisterAnnotation)
    }
}

