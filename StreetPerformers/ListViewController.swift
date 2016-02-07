//
//  ListViewController.swift
//  StreetPerformers
//
//  Created by Jacob on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import UIKit
protocol LocationDelegate{
   func getLocation() -> PFGeoPoint?
}
class PerformanceListRow: UITableViewCell{
    @IBOutlet var imageDisplay: UIImageView!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var bio: UILabel!
    @IBOutlet var stars: StarsView!
    var userLoc: LocationDelegate!
    var perf: Upload!
    func assignRow(perf: PFObject){
        self.stars.userInteractionEnabled = false
        //imageDisplay.image = //
        bio.text = perf["biography"] as? String
        (perf["image"] as! PFFile).getDataInBackgroundWithBlock { (data, err) -> Void in
            if let imgData = data{
                dispatch_async(dispatch_get_main_queue()){
                self.imageDisplay.image = UIImage(data: imgData)
                }
            }
        }
        if let rating = perf["rating"] as? Int{
            stars.setValue(rating)
        }
        if(userLoc.getLocation() != nil){
            let loc = perf["location"] as! PFGeoPoint
            let mi = loc.distanceInMilesTo(userLoc.getLocation())
            let y = Double(round(1000*mi)/1000)
            distanceLabel.text = "\(y) mi away"
        }else{
        distanceLabel.text = "Right around the corner!"
        }
    }
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationDelegate{
    @IBOutlet var table: UITableView!
    var performances: [PFObject]?
    var location: PFGeoPoint?
    var cat: String?
    @IBOutlet var yellowView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        loadPerformances()
        loadLocation()
        if(cat != nil){
            yellowView.text = cat
        }
        table.registerNib(UINib(nibName: "PerformanceListRow", bundle: nil), forCellReuseIdentifier: "PerformanceCell")
    }
    override func viewDidAppear(animated: Bool) {
        loadPerformances()
        loadLocation()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCellWithIdentifier("PerformanceCell", forIndexPath: indexPath) as! PerformanceListRow
        cell.userLoc = self
        cell.assignRow(performances![indexPath.row])
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let perfs = performances{
            return perfs.count
        }
        return 0
    }
    func getLocation() -> PFGeoPoint?{
        return self.location
    }
    func loadLocation(){
        PFGeoPoint.geoPointForCurrentLocationInBackground {
            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
            self.location = geoPoint
            dispatch_async(dispatch_get_main_queue()){
                self.table.reloadData()
            }
        }
    }
        func loadPerformances(){
        var query = PFQuery(className:"Performance")
        query.orderByDescending("createdAt")
        query.limit = 50
            if(self.cat != nil){
                query.whereKey("Category", equalTo: self.cat!)
            }
        query.findObjectsInBackgroundWithBlock { (objects, err) -> Void in
            if let perfs = objects{
                self.performances = [PFObject]()
                for perf in perfs{
                    self.performances?.append(perf)
                }
                dispatch_async(dispatch_get_main_queue()){
                    self.table.reloadData()
                }
            }
        }
    }
}