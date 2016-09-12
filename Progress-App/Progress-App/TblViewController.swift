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
    
//    var items = [NSDictionary]()
    var items  = []
    var desc: DescViewController!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "orange-bg"))
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        items = [NSArray]()
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
            let date = dict["date"] as! String
            
            // delete data from firebase
            
         let  profile = rootRef.childByAppendingPath(title)
             rootRef.childByAppendingPath(content)
            rootRef.childByAppendingPath(date)
            profile.removeValue()
        }
    }
    
    // MARK:- Configure Cell
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        let dict = items[indexPath.row]
        
        cell.textLabel?.text = dict["title"] as? String
        cell.detailTextLabel?.text = dict["date"] as? String
        
        
    }
    
    
    
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            
            
            print("products at \(indexPath.row)  --> \(items[indexPath.row]["title"])")
            let products = items[indexPath.row]["title"]
            desc.titlename = products as! String
            
            print(desc.titlename)
            
//            if let products = items[indexPath.row]["title"]
//            {
//                performSegueWithIdentifier("editSegue", sender: self)
//            }
        }
    
    
    
    
    //    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("products at \(indexPath.row)  --> \(items[indexPath.row]["title"])")
//        if let products = items[indexPath.row]["title"] as? [[String:String]]{
//            valueTopass = products
//            performSegueWithIdentifier("editSegue", sender: self)
//        }
//    }
//
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
//        
//        if (segue.identifier == "editSegue") {
//            let selectedIndexPath = self.tableView.indexPathForSelectedRow
//
//            let viewController = segue.destinationViewController as! DescViewController
//            viewController.productsValue = items[selectedIndexPath!.row] as! NSString
//            //print(productValues)
//        }
//    }
    
    
    
    
    
    
    
    

    
    // code for segue
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "editSegue" {
//            let destination = segue.destinationViewController as? DescViewController
//            let cell = sender as! UITableViewCell
//            let selectedRow = tableView.indexPathForCell(cell)!.row
//            
//            print(items[selectedRow])
//            
////            destination!.selectedValue = items[selectedRow] as! NSString as! NSString
//        }
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

