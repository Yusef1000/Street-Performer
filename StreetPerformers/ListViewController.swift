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
    func assignRow(perf: Upload){
        imageDisplay.image = perf.photo
        bio.text = perf.bio
        distanceLabel.text = "Right around the corner!"
    }
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var table: UITableView!
    var performances: [Upload]?
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
        
    }
}