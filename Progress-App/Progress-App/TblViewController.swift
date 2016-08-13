//
//  ViewController.swift
//  Progress-App
//
//  Created by Administrator on 09/08/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class TblViewController: UITableViewController {
    
    var rootRef = FIRDatabase.database().reference()
    var items = [NSDictionary]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        items = [NSDictionary]()
        
        loadDataFromFirebase()
    }
    

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
       let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        configureCell(cell, indexPath: indexPath)
//        tableViewStyle(cell)
        
        return cell
        
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let dict = items[indexPath.row]
            let title = dict["title"] as! String
            let content = dict["content"] as! String
            
            // delete data from firebase
            
         let  profile = rootRef.childByAppendingPath(title)
             rootRef.childByAppendingPath(content)
            profile.removeValue()
        }
    }
    
    // MARK:- Configure Cell
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        let dict = items[indexPath.row]
        
        cell.textLabel?.text = dict["title"] as? String
        cell.detailTextLabel?.text = dict["content"] as? String
        
//        let TimeInterval = dict["savedTime"] as! NSTimeInterval
//        populateTimeInterval(cell, timeInterval: TimeInterval)
        
    }
    
    // MARK:- Populate Timeinterval
    
//    func populateTimeInterval(cell: UITableViewCell, timeInterval: NSTimeInterval) {
//        
//        let date = NSDate(timeIntervalSinceNow: timeInterval)
////        let dateStr = formatDate(date)
////        
////        cell.detailTextLabel?.text = dateStr
//    }
    
    
    // MARK:- Apply TableViewCell Style
    
//    func tableViewStyle(cell: UITableViewCell) {
//        cell.contentView.backgroundColor = backgroundColor
//        cell.backgroundColor = backgroundColor
//        
//        cell.textLabel?.font =  UIFont(name: "HelveticaNeue-Medium", size: 15)
//        cell.textLabel?.textColor = textColor
//        cell.textLabel?.backgroundColor = backgroundColor
//        
//        cell.detailTextLabel?.font = UIFont.boldSystemFontOfSize(15)
//        cell.detailTextLabel?.textColor = UIColor.grayColor()
//        cell.detailTextLabel?.backgroundColor = backgroundColor
//    }
    
    // MARK:- Load data from Firebase
    
    func loadDataFromFirebase() {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        rootRef.observeEventType(.Value, withBlock: { snapshot in
            var tempItems = [NSDictionary]()
            
            for item in snapshot.children {
                let child = item as! FIRDataSnapshot
                let dict = child.value as! NSDictionary
                tempItems.append(dict)
            }
            
            self.items = tempItems
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
        })
    }


    

}

