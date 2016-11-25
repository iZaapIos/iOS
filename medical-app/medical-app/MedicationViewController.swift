//
//  MedicationViewController.swift
//  medical-app
//
//  Created by Administrator on 07/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class MedicationViewController: UIViewController,UIPopoverPresentationControllerDelegate, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableview: UITableView!
     var itemslist = [medication]()
 
    var databaseRef: FIRDatabaseReference!
     

    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
         loadDataFromFirebase()
        
//        let longTitleLabel = UILabel()
//        longTitleLabel.text = "Medications"
//        longTitleLabel.sizeToFit()
//        
//        let leftItem = UIBarButtonItem(customView: longTitleLabel)
//        self.navigationItem.leftBarButtonItem = leftItem

        }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
       
        
        
        
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemslist.count
        
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let med = itemslist[indexPath.row]
        print(med)
       
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MedTableViewCell
        cell.MedLabel.text = med.name
        cell.dosagelbl.text = med.dosage
        cell.dosagelbl.hidden = true
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "selectedmedSegue" {
                let selectedTopic = itemslist[tableview.indexPathForSelectedRow!.row]
            
            var seldosage = selectedTopic.dosage
            
                let vc = segue.destinationViewController as! SelectedTabltViewController
        
                  vc.TopicPassed = selectedTopic.name
            
              Manager.DosageText = seldosage
            print(seldosage)
        }
    }
    
    

    
    
    func loadDataFromFirebase() {
        
        
        databaseRef = FIRDatabase.database().reference().child("medication")
        print(databaseRef.childByAutoId())
        

        databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
        

            var newItems = [medication]()
            print(newItems)
            
            for item in snapshot.children {
                
                let newNote = medication(snapshot: item as! FIRDataSnapshot)
               
                newItems.append(newNote)
                
            }
            self.itemslist = newItems
            self.tableview.reloadData()
            
        })
    }
    
    }

        
        
        
        
        
        
        
        
        
        


