//
//  SummaryViewController.swift
//  medical-app
//
//  Created by Administrator on 24/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SummaryTableViewController: UITableViewController {
    
    var items = [SummaryData]()
    
    var databaseRef: FIRDatabaseReference!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
        loadDataFromFirebase()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! summaryTableCell
        let summ = items[indexPath.row]
        
        cell.painlvl_lbl.text = summ.pain_level
        cell.comments_lbl.text = summ.comments
        cell.create_lbl.text = summ.created_on
        cell.remedy_lbl.text = summ.remedies
        cell.key_lbl.text = summ.key
        print(summ.key)
         return cell
    }
    
    
    func loadDataFromFirebase() {
        
        var u_id = FIRAuth.auth()?.currentUser!.uid
        databaseRef = FIRDatabase.database().reference().child("medical_details")
        
    databaseRef.queryOrderedByChild("user_id").queryEqualToValue(u_id).observeEventType(.Value, withBlock: { (snapshot) in
            
            var newItems = [SummaryData]()
            
            for item in snapshot.children {
                
                let newNote = SummaryData(snapshot: item as! FIRDataSnapshot)
                newItems.insert(newNote, atIndex: 0)
            }
            self.items = newItems
            self.tableView.reloadData()
            
            }) { (error) in
                print(error.localizedDescription)
                self.tableView.reloadData()
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "gotoSummaryDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let summary: SummaryData
     
                let vc = segue.destinationViewController as! SummaryDetailViewController
                let indexPath = tableView.indexPathForSelectedRow!
                 vc.summary = items[indexPath.row]

               
            }
            
        }
        
    }


    



}
