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
        
    @IBOutlet weak var tableView: UITableView!
    var itemslist = [SummaryDetailsData]()
//    var itemslist: [String]=[]
//    var itemslist = [[String:String]]()
//    var itemslist: [[String: AnyObject]] = []

    
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
        return itemslist.count
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SummaryDetailsCell
        let detl = itemslist[indexPath.row]
        
//        cell.tablet_lbl.text = detl["tablet"]
        
//        cell.dosage_lbl.text = detl.dosage
//        cell.tabNo_lbl.text = detl.number_of_tablets
//        cell.freq_lbl.text = detl.frequency
//        cell.interval_lbl.text = detl.interval
//        cell.remin_lbl.text = detl.reminder

        return cell
    }

    
    func loadDataFromFirebase(){
        
        
        databaseRef = FIRDatabase.database().reference().child("medical_details")
        
        var tym = summary?.created_on
        var u_id = FIRAuth.auth()?.currentUser!.uid
        
        databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
        for item in snapshot.children {
            
        let date = item.value!!["created_on"] as? String
        let usr_id = item.value!!["user_id"] as? String
            
            if (date == tym && usr_id == u_id)
            {
            
                
//               let usr_id = item.value!!["user_id"] as? String
                
//                self.databaseRef.child("medicine").observeEventType(.Value , withBlock: { (snapshot) in
         self.databaseRef.queryOrderedByChild("created_on").queryEqualToValue(tym).observeEventType(.Value , withBlock: { (snapshot) in
            
                   for item in snapshot.children {
                    
                    var newItems = [SummaryDetailsData]()
                    
                    if let med = item.value!!["medicine"] as? NSDictionary {
                        
//                        self.itemslist.append(med as! [String : AnyObject])
//                        
//                         print(self.itemslist)
                        
                         let newNote = SummaryDetailsData(snapshot: (med as? FIRDataSnapshot)!)
                      newItems.insert(newNote, atIndex: 0)
                       
                        
            
                    }
//                    self.items = newItems
//                    self.tableView.reloadData()
                    }
            
                })
            }
            
            
            }
            
            })
        
        
//        databaseRef.queryOrderedByChild("created_on").queryEqualToValue(tym).observeEventType(.ChildAdded , withBlock: { (snapshot) in
//            
//            for item in snapshot.children {
//            
//                print(snapshot)
//                
//            }
//            
//        })
//     
     
//        databaseRef.observeEventType(.ChildAdded , withBlock: { (snapshot) in
//        
//            var mvi = snapshot.value
//             print(mvi)
//            
//            var newItems = [SummaryDetailsData]()
//
//            for item in snapshot.children
//            {
//                 print(item.key)
//                let newNote = SummaryDetailsData(snapshot: (item as? FIRDataSnapshot)!)
//                newItems.insert(newNote, atIndex: 0)
//                
//            }
//            self.items = newItems
//            self.tableView.reloadData()
//                
//           }) { (error) in
//               print(error.localizedDescription)
//               self.tableView.reloadData()
//             }
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


////                 let db = snapshot.childSnapshotForPath("medicine")




