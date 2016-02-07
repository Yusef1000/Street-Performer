//
//  MapViewController.swift
//  StreetPerformers
//
//  Created by Yusef Abdulla on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brownUni()
        
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