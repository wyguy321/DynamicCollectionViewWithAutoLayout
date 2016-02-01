//
//  MessagesCollectionViewController.swift
//  MessageTests
//
//  Created by Wyatt on 2/1/16.
//  Copyright © 2016 Wyatt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MessagesCollectionViewController: UICollectionViewController,CHTCollectionViewDelegateWaterfallLayout {
    
    var dict = Dictionary<String,UICollectionViewCell>()
    
    var columnCount = 0
    
    
    
    var RadomStrings = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collectionView?.backgroundColor = UIColor.lightGrayColor()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        
        
       self.collectionView?.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        let layout = self.collectionViewLayout as! CHTCollectionViewWaterfallLayout
        

        for var i = 0; i < 50; i++ {
            
            let length = UInt32(500)
            
            let rand = arc4random_uniform(length)
            
            RadomStrings.append(randomStringWithLength(Int(rand)) as String)
            
            
        }
        
        
        layout.minimumColumnSpacing = 15
        
        layout.minimumInteritemSpacing = 30
        
        
        layout.sectionInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return RadomStrings.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
  
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? CollectionViewCell
           let randomString = RadomStrings[indexPath.item]
        
        cell?.RandomStringLabel.text = randomString
        
        cell?.backgroundColor = UIColor.whiteColor()
        // Configure the cell
    
        return cell!
    }

    func collectionView (collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var cell = dict["heightCell"] as? CollectionViewCell
        
        let randomString = RadomStrings[indexPath.item]
        
        let float = CGFloat(columnCount)
        let width = collectionView.bounds.size.width / float

        
        if cell == nil {
            
            cell = NSBundle.mainBundle().loadNibNamed("CollectionViewCell", owner: self, options: nil)[0] as? CollectionViewCell
            
            
            dict["heightCell"] = cell
            
        }

        
        cell?.RandomStringLabel.text = randomString
        
 
        cell!.frame = CGRectMake(0, 0, CGRectGetWidth(collectionView.bounds), CGRectGetHeight(cell!.frame))
               cell!.setNeedsLayout()
             cell!.layoutIfNeeded()
        
        var size = cell?.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        
        
        size?.width = width
        
        
     return CGSize(width: width, height: size!.height)
    }
    func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        columnCountForSection section: NSInteger) -> NSInteger {
            
            
            if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
                
                columnCount = 3
               
                return columnCount
                
            }
            
            columnCount = 2
 
            
            return columnCount
    }

    func randomStringWithLength (len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
