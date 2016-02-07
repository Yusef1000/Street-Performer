//
//  SearchViewController.swift
//  StreetPerformers
//
//  Created by Emma Sloan on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import UIKit
class SearchButtonCell: UICollectionViewCell{
    @IBOutlet var uImage: UIImageView!
    var cate: Category!
    func assignCell(cat: Category){
        self.cate = cat
        uImage.image = cat.image
    }
}
class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    @IBOutlet var collectionView : UICollectionView!
    var categoryList = [Category(description: "Dance", image: UIImage(named: "buttons-1")!),Category(description: "Vocals", image: UIImage(named: "buttons-2")!),Category(description: "Instruments", image: UIImage(named: "buttons-3")!),Category(description: "Make-Up", image: UIImage(named: "buttons-4")!),Category(description: "Stunts", image: UIImage(named: "buttons-5")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: "SearchButtonCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int{
            return categoryList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! SearchButtonCell
            cell.assignCell(categoryList[indexPath.row])
            return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            let size = (collectionView.frame.width / 2) - 3
            return CGSize(width: size, height: size * 0.66)
    }
    

}
