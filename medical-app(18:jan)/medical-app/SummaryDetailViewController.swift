//
//  SummaryDertailViewController.swift
//  medical-app
//
//  Created by Administrator on 26/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SummaryDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var PainLevel: String?
    var Comments:String?
    var Remedy:String?
    var CreatedOn:String?
        
    var items = [SummaryDetailsData]()
    
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
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        pain_detlbl!.text = summary?.pain_level
        com_detlbl!.text = summary?.comments
        remedy_detlbl.text = summary?.remedies
        create_detlbl.text = summary?.created_on
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
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

    
    func loadDataFromFirebase(){
        
        let tym = summary?.created_on
        print(tym)
        var u_id = FIRAuth.auth()?.currentUser!.uid
        
        databaseRef = FIRDatabase.database().reference().child("medical_details")
        
       
 
    
//        databaseRef.queryOrderedByChild("created_on").queryEqualToValue(tym).observeEventType(.ChildAdded , withBlock: { (snapshot) in
//            
//            for item in snapshot.children {
//            
//                print(snapshot)
//                
//            }
//            
//        })
     
        databaseRef.queryOrderedByChild("created_on").queryEqualToValue(tym).observeSingleEventOfType(.ChildAdded, withBlock: { snapshot in
           
            for item in snapshot.children{
                 let db = snapshot.childSnapshotForPath("medicine")
                print(db)
                
                var newItems = [SummaryDetailsData]()

                for val in snapshot.children{
                     print(val)
                    let newNote = SummaryDetailsData(snapshot: val as! FIRDataSnapshot)
                    print(newNote)
                    newItems.insert(newNote, atIndex: 0)
                }
                   }
            
        })
        


        
        
      
//       databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
//            
//            var newItems = [Note]()
//            
//            for item in snapshot.children {
//                
//                let newNote = Note(snapshot: item as! FIRDataSnapshot)
//                newItems.insert(newNote, atIndex: 0)
//                
//            }
//            self.items = newItems
//            self.tableView.reloadData()
//            
//            }) { (error) in
//                print(error.localizedDescription)
//                self.tableView.reloadData()
//        }
        
    }

    
    
}




//        databaseRef.queryOrderedByChild("created_on").queryEqualToValue(tym).observeEventType(.ChildAdded , withBlock: { (snapshot) in
//
//            for item in snapshot.children {
//
//                print(snapshot)
//
//            }
//
//        })



