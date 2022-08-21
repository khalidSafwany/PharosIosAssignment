//
//  CItyMapViewController.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/21/22.
//

import UIKit
import MapKit

class CItyMapViewController: UIViewController {

    var theMapView: MKMapView = {
        let mapView: MKMapView
        mapView = MKMapView(frame: CGRect.zero)
        
        
        return mapView
    }()
    
    var mapObject: MapObject?
    
    
    

    private var selectedCity = City()
    
    func setSelectedCity(_ selectedCity:City){
        self.selectedCity = selectedCity
        createMapObject()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureMapView()
        theMapView.addAnnotation(mapObject!)
        self.theMapView.showAnnotations(self.theMapView.annotations, animated: true)
        self.theMapView.setCenter(mapObject!.coordinate, animated: true)
        self.theMapView.isZoomEnabled = true
        self.title = selectedCity.getCityName()
        self.view.backgroundColor = UIColor.white
    }
    

    func configureMapView() {

        view.addSubview(theMapView)
        theMapView.translatesAutoresizingMaskIntoConstraints = false
        theMapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        if #available(iOS 11.0, *) {
            theMapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                theMapView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            }
        theMapView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        theMapView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true

        theMapView.showsUserLocation = true
        theMapView.userTrackingMode = .follow
        let region = MKCoordinateRegion( center: mapObject!.coordinate, latitudinalMeters: CLLocationDistance(exactly: 5000)!, longitudinalMeters: CLLocationDistance(exactly: 5000)!)
        theMapView.setRegion(theMapView.regionThatFits(region), animated: true)

        theMapView.frame = view.frame
        
    }
    
    private func createMapObject(){
        
        let lat = Double(selectedCity.getCityCoordinates()?.getCitylatitude() ?? "0.0")
        let long = Double(selectedCity.getCityCoordinates()?.getCitylongitude() ?? "0.0")
        
        mapObject = MapObject(
            title: selectedCity.getCityName(),
            subtitle: selectedCity.getCountrySymbols(),
            coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: long!))
    }

}
