//
//  ViewController.swift
//  HackBrown
//
//  Created by Yusef Abdulla on 2/6/16.
//  Copyright © 2016 Yusef Abdulla. All rights reserved.
//

import UIKit
import MapKit
//import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brownUni()
        brownUni1()
    }
    
    func brownUni(){
        //Coordinates
        let brownUniLat: CLLocationDegrees = 30.1033
        let brownUniLong: CLLocationDegrees = -95.6337
        let brownUniCoordinate = CLLocationCoordinate2D(latitude: brownUniLat, longitude: brownUniLong)
        //Span
        let latDelta:CLLocationDegrees = 0.02
        let longDelta:CLLocationDegrees = 0.02
        let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let brownUniRegion = MKCoordinateRegion(center: brownUniCoordinate, span: brownUniSpan)
        //PIN AND DETAILS
        Map.setRegion(brownUniRegion, animated: true)
        let brownUniAnnotation = MKPointAnnotation()
        brownUniAnnotation.title = "Mike Sullivan"
        brownUniAnnotation.subtitle = "Professional HipHop Dancer"
        brownUniAnnotation.coordinate = brownUniCoordinate
        brownUniAnnotation.provideImageData(<#T##data: UnsafeMutablePointer<Void>##UnsafeMutablePointer<Void>#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, <#T##y: Int##Int#>, size: <#T##Int#>, <#T##height: Int##Int#>, userInfo: <#T##AnyObject?#>)
        Map.addAnnotation(brownUniAnnotation)
    }
    func brownUni1(){
        //Coordinates
        let brownUniLat: CLLocationDegrees = 30.1020
        let brownUniLong: CLLocationDegrees = -95.6320
        let brownUniCoordinate = CLLocationCoordinate2D(latitude: brownUniLat, longitude: brownUniLong)
        //Span
        let latDelta:CLLocationDegrees = 0.02
        let longDelta:CLLocationDegrees = 0.02
        let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let brownUniRegion = MKCoordinateRegion(center: brownUniCoordinate, span: brownUniSpan)
        //PIN AND DETAILS
        Map.setRegion(brownUniRegion, animated: true)
        let brownUniAnnotation = MKPointAnnotation()
        brownUniAnnotation.title = "Trisha Tosh"
        brownUniAnnotation.subtitle = "Violin Player"
        brownUniAnnotation.coordinate = brownUniCoordinate
        Map.addAnnotation(brownUniAnnotation)
    }


}

