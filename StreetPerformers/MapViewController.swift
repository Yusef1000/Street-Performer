//
//  MapViewController.swift
//  StreetPerformers
//
//  Created by Yusef Abdulla on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation: MKAnnotationView{
    var img: UIImage!
    func assignImage(cat: String){
        img = UIImage(named: cat.lowercaseString)
    }
    
}

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        loadLocation()
    }
    
//        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//            if (annotation is MKUserLocation) {
//                return nil
//            }
//            if (annotation.isKindOfClass(PinAnnotation)) {
//                let customAnnotation = annotation as? PinAnnotation
//                mapView.translatesAutoresizingMaskIntoConstraints = false
//                var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("PinAnnotation") as MKAnnotationView!
//                
//                if (annotationView == nil) {
//                    annotationView = customAnnotation?.annotationView()
//                } else {
//                    annotationView.annotation = annotation;
//                }
//                
//                //self.addBounceAnnotationView(annotationView)
//                return annotationView
//            } else {
//                return nil
//            }
//        }

    

    
    
    var location: PFGeoPoint?
    func loadLocation(){
        PFGeoPoint.geoPointForCurrentLocationInBackground {
            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
            self.location = geoPoint
            dispatch_async(dispatch_get_main_queue()){
                let lat = self.location!.latitude
                let long = self.location!.longitude
                let loc = CLLocationCoordinate2D(latitude: lat, longitude: long)
                let latDelta:CLLocationDegrees = 10
                let longDelta:CLLocationDegrees = 10
                let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
                let brownUniRegion = MKCoordinateRegion(center: loc, span: brownUniSpan)
                self.map.setRegion(brownUniRegion, animated: true)
                self.loadPerformances()
            }
        }
    }
    var performances: [PFObject]?
    func loadPerformances(){
        var query = PFQuery(className:"Performance")
        query.orderByDescending("createdAt")
        query.limit = 50
        query.findObjectsInBackgroundWithBlock { (objects, err) -> Void in
            if let perfs = objects{
                self.performances = [PFObject]()
                for perf in perfs{
                    self.performances?.append(perf)
                    
                    dispatch_async(dispatch_get_main_queue()){
                        let loc = perf["location"] as! PFGeoPoint
                                let lat = loc.latitude
                                let long = loc.longitude
                                let loc2 = CLLocationCoordinate2D(latitude: lat, longitude: long)
                        let newAnnot = MKPointAnnotation()
                        newAnnot.title = perf["biography"] as? String
                        if(self.location != nil){
                            let loc = perf["location"] as! PFGeoPoint
                            let mi = loc.distanceInMilesTo(self.location)
                            let y = Double(round(1000*mi)/1000)

                        newAnnot.subtitle = "\(y) mi away"
                        newAnnot.coordinate = loc2
                        self.map.addAnnotation(newAnnot)
                        }
                }
            }
        }

    }
    }
    func brownUni(){
        PFGeoPoint.geoPointForCurrentLocationInBackground {
            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
            if error == nil {
                if let myLocation = geoPoint{
                    dispatch_async(dispatch_get_main_queue()){
                    let lat = myLocation.latitude
                    let long = myLocation.longitude
                    let loc = CLLocationCoordinate2D(latitude: lat, longitude: long)
                    let latDelta:CLLocationDegrees = 0.02
                    let longDelta:CLLocationDegrees = 0.02
                    let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
                    let brownUniRegion = MKCoordinateRegion(center: loc, span: brownUniSpan)
                    self.map.setRegion(brownUniRegion, animated: true)
                    let brownUniAnnotation = MKPointAnnotation()
                    brownUniAnnotation.title = "Mike Sullivan"
                    brownUniAnnotation.subtitle = "Professional HipHop Dancer"
                    brownUniAnnotation.coordinate = loc
                    //brownUniAnnotation.provideImageData(<#T##data: UnsafeMutablePointer<Void>##UnsafeMutablePointer<Void>#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, <#T##y: Int##Int#>, size: <#T##Int#>, <#T##height: Int##Int#>, userInfo: <#T##AnyObject?#>)
                    self.map.addAnnotation(brownUniAnnotation)
                    }
                }
            }else{
                
            }
        }
}
}