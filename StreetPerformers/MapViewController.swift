//
//  MapViewController.swift
//  StreetPerformers
//
//  Created by Yusef Abdulla on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation : NSObject, MKAnnotation {
    private var coord: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return coord
        }
    }
    func getAysnc(obj: PFObject){
        (obj["image"] as! PFFile).getDataInBackgroundWithBlock { (data, err) -> Void in
            if let imgData = data{
                dispatch_async(dispatch_get_main_queue()){
                    self.img = UIImage(data: imgData)
                }
            }
        }

    }
    var title: String? = ""
    var subtitle: String? = ""
    var img: UIImage?
    
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        self.coord = newCoordinate
    }
}

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        brownUni()
        brownUni1()
        brownUni2()
        brownUni3()
        brownUni4()        
        
        //loadLocation()
        //loadPerformances()
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
    map.setRegion(brownUniRegion, animated: true)
    let brownUniAnnotation = MKPointAnnotation()
    brownUniAnnotation.title = "Mike Sullivan"
    brownUniAnnotation.subtitle = "Professional HipHop Dancer"
    brownUniAnnotation.coordinate = brownUniCoordinate
    //brownUniAnnotation.provideImageData(<#T##data: UnsafeMutablePointer<Void>##UnsafeMutablePointer<Void>#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, <#T##y: Int##Int#>, size: <#T##Int#>, <#T##height: Int##Int#>, userInfo: <#T##AnyObject?#>)
    map.addAnnotation(brownUniAnnotation)
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
        map.setRegion(brownUniRegion, animated: true)
        let brownUniAnnotation = MKPointAnnotation()
        brownUniAnnotation.title = "Trisha Tosh"
        brownUniAnnotation.subtitle = "Violin Player"
        brownUniAnnotation.coordinate = brownUniCoordinate
        map.addAnnotation(brownUniAnnotation)
    }
    func brownUni2(){
        //Coordinates
        let brownUniLat: CLLocationDegrees = 30.1000
        let brownUniLong: CLLocationDegrees = -95.6300
        let brownUniCoordinate = CLLocationCoordinate2D(latitude: brownUniLat, longitude: brownUniLong)
        //Span
        let latDelta:CLLocationDegrees = 0.02
        let longDelta:CLLocationDegrees = 0.02
        let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let brownUniRegion = MKCoordinateRegion(center: brownUniCoordinate, span: brownUniSpan)
        //PIN AND DETAILS
        map.setRegion(brownUniRegion, animated: true)
        let brownUniAnnotation = MKPointAnnotation()
        brownUniAnnotation.title = "Billy Bob"
        brownUniAnnotation.subtitle = "Opera Singer"
        brownUniAnnotation.coordinate = brownUniCoordinate
        map.addAnnotation(brownUniAnnotation)
    }
    func brownUni3(){
        //Coordinates
        let brownUniLat: CLLocationDegrees = 30.0120
        let brownUniLong: CLLocationDegrees = -95.6345
        let brownUniCoordinate = CLLocationCoordinate2D(latitude: brownUniLat, longitude: brownUniLong)
        //Span
        let latDelta:CLLocationDegrees = 0.02
        let longDelta:CLLocationDegrees = 0.02
        let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let brownUniRegion = MKCoordinateRegion(center: brownUniCoordinate, span: brownUniSpan)
        //PIN AND DETAILS
        map.setRegion(brownUniRegion, animated: true)
        let brownUniAnnotation = MKPointAnnotation()
        brownUniAnnotation.title = "JOHN CENA!!!"
        brownUniAnnotation.subtitle = "Profession Wrestler"
        brownUniAnnotation.coordinate = brownUniCoordinate
        map.addAnnotation(brownUniAnnotation)
    }
    func brownUni4(){
        //Coordinates
        let brownUniLat: CLLocationDegrees = 30.10100
        let brownUniLong: CLLocationDegrees = -95.6340
        let brownUniCoordinate = CLLocationCoordinate2D(latitude: brownUniLat, longitude: brownUniLong)
        //Span
        let latDelta:CLLocationDegrees = 0.02
        let longDelta:CLLocationDegrees = 0.02
        let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let brownUniRegion = MKCoordinateRegion(center: brownUniCoordinate, span: brownUniSpan)
        //PIN AND DETAILS
        map.setRegion(brownUniRegion, animated: true)
        let brownUniAnnotation = MKPointAnnotation()
        brownUniAnnotation.title = "Thomas Jones"
        brownUniAnnotation.subtitle = "Dedicated Drummer"
        brownUniAnnotation.coordinate = brownUniCoordinate
        map.addAnnotation(brownUniAnnotation)
    }
}
    /*

        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            if (annotation is MKUserLocation) {
                //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
                //return nil so map draws default view for it (eg. blue dot)...
                return nil
            }
            if(annotation is PinAnnotation){
                let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
                let img = UIImageView(image: (annotation as! PinAnnotation).img)
                // :(
                pinAnnotationView.leftCalloutAccessoryView = img
                pinAnnotationView.canShowCallout = true

            }
            let reuseId = "test"
            
            var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            if anView == nil {
                anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                anView!.image = UIImage(named:"dance")
                anView!.canShowCallout = true
            }
            else {
                //we are re-using a view, update its annotation reference...
                anView!.annotation = annotation
            }
            
            return anView

    }

    
    //func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
    
    
    
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
                        let newAnnot = PinAnnotation()
                        newAnnot.getAysnc(perf)
                        newAnnot.title = perf["biography"] as? String
                        if(self.location != nil){
                            let loc = perf["location"] as! PFGeoPoint
                            let mi = loc.distanceInMilesTo(self.location)
                            let y = Double(round(1000*mi)/1000)

                        newAnnot.subtitle = "\(y) mi away"
                        newAnnot.setCoordinate(loc2)
                        self.map.addAnnotation(newAnnot)
                        }
                }
            }
        }

    }
    }
*/
//    func brownUni(){
//        PFGeoPoint.geoPointForCurrentLocationInBackground {
//            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
//            if error == nil {
//                if let myLocation = geoPoint{
//                    dispatch_async(dispatch_get_main_queue()){
//                    let lat = myLocation.latitude
//                    let long = myLocation.longitude
//                    let loc = CLLocationCoordinate2D(latitude: lat, longitude: long)
//                    let latDelta:CLLocationDegrees = 0.02
//                    let longDelta:CLLocationDegrees = 0.02
//                    let brownUniSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//                    let brownUniRegion = MKCoordinateRegion(center: loc, span: brownUniSpan)
//                    self.map.setRegion(brownUniRegion, animated: true)
//                    let brownUniAnnotation = MKPointAnnotation()
//                    brownUniAnnotation.title = "Mike Sullivan"
//                    brownUniAnnotation.subtitle = "Professional HipHop Dancer"
//                    brownUniAnnotation.coordinate = loc
//                    //brownUniAnnotation.provideImageData(<#T##data: UnsafeMutablePointer<Void>##UnsafeMutablePointer<Void>#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, <#T##y: Int##Int#>, size: <#T##Int#>, <#T##height: Int##Int#>, userInfo: <#T##AnyObject?#>)
//                    self.map.addAnnotation(brownUniAnnotation)
//                    }
//                }
//            }else{
//                
//            }
//        }
//}
