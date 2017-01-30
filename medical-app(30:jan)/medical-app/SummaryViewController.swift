//
//  SummaryViewController.swift
//  medical-app
//
//  Created by Administrator on 23/01/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SummaryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var items = [SummaryDetailsData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var pain_detlbl: UILabel!
    @IBOutlet weak var com_detlbl: UILabel!
    @IBOutlet weak var remedy_detlbl: UILabel!
    @IBOutlet weak var create_detlbl: UILabel!

    var summary:SummaryData?
    var databaseRef: FIRDatabaseReference!
    var Ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDataFromFirebase()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SummaryDetailsCell
        let detl = items[indexPath.row]
        
        cell.tablet_lbl.text = detl.tablet
        cell.dosage_lbl.text = detl.dosage
        cell.tabNo_lbl.text = detl.number_of_tablets
        cell.freq_lbl.text = detl.frequency
        cell.interval_lbl.text = detl.interval
        cell.remin_lbl.text = detl.reminder
        
        return cell
    }

    func loadDataFromFirebase() {
        
        let tym = summary?.created_on
        print(tym)
        var u_id = FIRAuth.auth()?.currentUser!.uid
        
        databaseRef = FIRDatabase.database().reference().child("medical_details")
        let ref = databaseRef.queryOrderedByChild("created_on").queryEqualToValue(tym)
        
        print(ref)
        
        ref.observeEventType(.ChildAdded , withBlock: { (snapshot) in
            
            
            var newItems = [SummaryDetailsData]()
            
                for item in snapshot.children
            {
                
                if let name = item.value!!["pain_level"] as? String
                {
                    print(name)
                }
                
                print(item)
                let newNote = SummaryDetailsData(snapshot: (item as? FIRDataSnapshot)!)
                newItems.insert(newNote, atIndex: 0)
                
            }
            self.items = newItems
            self.tableView.reloadData()
            
            }) { (error) in
                print(error.localizedDescription)
                self.tableView.reloadData()
        }
    }

        
}


