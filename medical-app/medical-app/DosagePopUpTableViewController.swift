//
//  MedListTableViewController.swift
//  medical-app
//
//  Created by Administrator on 03/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class DosagePopUpTableViewController: UITableViewController {
    var KeyPassed : String!
    

    
    var databaseRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromFirebase()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DosageTableCell
        cell.Dosagelbl.text = KeyPassed
      return cell
    }
    
    func loadDataFromFirebase() {
        
        
        databaseRef = FIRDatabase.database().reference().child("medication")
        

        databaseRef.observeEventType(.Value, withBlock: { snapshot in
           
            
            for item in snapshot.children{
            FIRDatabase.database().reference().child("medication").child("options").observeEventType(.Value, withBlock: {snapshot in
                    print(snapshot.value)
                })
            }
         
        })
        
            
//            
//            for item in snapshot.children {
//                
//        print(snapshot.value!.objectForKey("first"))
////
////                let newNote = medlist(snapshot: item as! FIRDataSnapshot)
////                
////                newItems.insert(newNote, atIndex: 0)
//            }
//
//            })
//            self.itemslist = newItems
//            self.tableview.reloadData()
//            
//            }) { (error) in
//                print(error.localizedDescription)
//                self.tableview.reloadData()
//        }
    }
    
}


    


