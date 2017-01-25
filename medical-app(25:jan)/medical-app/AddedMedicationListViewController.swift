//
//  MedicationListViewController.swift
//  medical-app
//
//  Created by Administrator on 24/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddedMedicationListViewController: UITableViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var databaseRef: FIRDatabaseReference!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
//        MedlistDataFromFirebase()
        
        
    }
    
    

    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
////        print(listArray.count)
////        return
//        
//    }
//    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let med = Addedlist[indexPath.row]
//        print(med)
        
        
  let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AddedMedTableCell
//        cell.MedNamelbl.text = med.name
//        cell.MedDoslbl.text = med.dosage
//        cell.MedQuanlbl.text = med.NoOfTab
        return cell
    }
//
//     func MedlistDataFromFirebase(){
//    
//        
//        databaseRef = FIRDatabase.database().reference().child("MedicationDetails").child("medicine")
//        databaseRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
//            
//            var newItems = [medlist]()
//            for item in snapshot.children {
//                
//            let newMed = medlist(snapshot: item as! FIRDataSnapshot)
//                  newItems.append(newMed)
//            }
//            
//            self.Addedlist = newItems
//            self.tableview.reloadData()
//        
//        })
//    }
//    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            
//            // Delete the row from the data source
//            let ref = Addedlist[indexPath.row].ref
//            ref!.removeValue()
//            Addedlist.removeAtIndex(indexPath.row)
//          
//        tableview.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        }
//        
//    }
//
    
    @IBAction func cancel(sender: AnyObject) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("SelectionMedication")
//        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    

    }
    
    

