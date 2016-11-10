//
//  MedicationViewController.swift
//  medical-app
//
//  Created by Administrator on 07/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class MedicationViewController: UIViewController,UIPopoverPresentationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
     var itemslist = [medlist]()
 
    var databaseRef: FIRDatabaseReference!
    var refHandle: UInt!
    

    
    

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
//        print(med)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MedTableViewCell
        cell.MedLabel.text = med.name
//        print(cell.MedLabel)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "selectedmedSegue" {
//            if let indexPath = tableview.indexPathForSelectedRow {
//                let med = itemslist[indexPath.row]
            print("condition satisfy")
//                
                let selectedTopic = itemslist[tableview.indexPathForSelectedRow!.row]
               print(selectedTopic)
                
                let vc = segue.destinationViewController as! SelectedTabltViewController
//            let indexPath = tableview.indexPathForSelectedRow!
                
                vc.TopicPassed = selectedTopic.name
            
                print(vc.TopicPassed)
//            }
            
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedTopic = itemslist[indexPath.row]
        
        let Sentences = SelectedTabltViewController()
       Sentences.TopicPassed = selectedTopic.name
     self.performSegueWithIdentifier("selectedmedSegue", sender: tableview)
        let pathSelect = tableview.indexPathForSelectedRow
        pathSelect
    }
    
    
    func loadDataFromFirebase() {
        
        
        databaseRef = FIRDatabase.database().reference().child("medication")
        
        print(databaseRef)
        
        databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
            
            var newItems = [medlist]()
            
            for item in snapshot.children {
                
                let newNote = medlist(snapshot: item as! FIRDataSnapshot)
               
                newItems.insert(newNote, atIndex: 0)
                
            }
            self.itemslist = newItems
            self.tableview.reloadData()
            
            }) { (error) in
                print(error.localizedDescription)
                self.tableview.reloadData()
        }
    }

}

        
        
        
        
        
        
        
        
        
        
//refHandle = ref.child("users").observeEventType(.ChildAdded  , withBlock: { (snapshot) in
//        if let dictionary = snapshot.value as? [String: AnyObject]{
//                
//                print(self.refHandle)
//                let items = med()
//                
//                items.setValuesForKeysWithDictionary(dictionary)
//                self.itemslist.append(items)
//    
//    dispatch_async(dispatch_get_main_queue(),{
//                    self.tableview.reloadData()
//                })
//                
//                
//              }
//    
//            })
//
//    }


