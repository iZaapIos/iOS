//
//  RequestClinicianViewController.swift
//  medical-app
//
//  Created by Administrator on 28/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RequestClinicianViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableview: UITableView!
    var clinArray = [Clinician]()
    
    var databaseRef: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromFirebase()

    }

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(clinArray.count)
        return self.clinArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ClinicianCell
         cell.clinician.text = clinArray[indexPath.row].clinician
         cell.clinName.text = clinArray[indexPath.row].Name
         cell.clinEmail.text = clinArray[indexPath.row].email
         cell.clinPh.text = clinArray[indexPath.row].phno
        return cell
    }
    
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            let ref = clinArray[indexPath.row].ref
            ref!.removeValue()
            clinArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func loadDataFromFirebase()
    {
      databaseRef = FIRDatabase.database().reference().child("Clinician Details")
        
        databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
            
            var newItems = [Clinician]()
            
            for item in snapshot.children {
                
                let newClin = Clinician(snapshot: item as! FIRDataSnapshot)
                print(newClin)
                newItems.append(newClin)
            }
            
            self.clinArray = newItems
            self.tableview.reloadData()
            })
            {
                (error) in
                print(error.localizedDescription)
            }
        
       }
 
}
