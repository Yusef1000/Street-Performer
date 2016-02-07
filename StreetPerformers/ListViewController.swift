//
//  ListViewController.swift
//  StreetPerformers
//
//  Created by Jacob on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import UIKit

class PerformanceListRow: UITableViewCell{
    @IBOutlet var imageDisplay: UIImageView!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var bio: UILabel!
    var perf: Upload!
    func assignRow(perf: PFObject){
        //imageDisplay.image = //
        print(perf)
        bio.text = perf["biography"] as? String
        (perf["image"] as! PFFile).getDataInBackgroundWithBlock { (data, err) -> Void in
            if let imgData = data{
                dispatch_async(dispatch_get_main_queue()){
                self.imageDisplay.image = UIImage(data: imgData)
                }
            }
        }
        
        distanceLabel.text = "Right around the corner!"
    }
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var table: UITableView!
    var performances: [PFObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        loadPerformances()
        table.registerNib(UINib(nibName: "PerformanceListRow", bundle: nil), forCellReuseIdentifier: "PerformanceCell")
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCellWithIdentifier("PerformanceCell", forIndexPath: indexPath) as! PerformanceListRow
        cell.assignRow(performances![indexPath.row])
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let perfs = performances{
            return perfs.count
        }
        return 0
    }
    func loadPerformances(){
        var query = PFQuery(className:"Performance")
        query.orderByDescending("createdAt")
        query.limit = 50
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