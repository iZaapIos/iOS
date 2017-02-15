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
    var medicinelist: [String]=[]
    var dosagelist: [String]=[]
 
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
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return medicinelist.count
        
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MedTableViewCell
        cell.MedLabel.text = medicinelist[indexPath.row]
        print(cell.MedLabel)
        cell.dosagelbl.text = dosagelist[indexPath.row]
        print(cell.dosagelbl)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        let indexPath = tableview.indexPathForSelectedRow!.row
             print(indexPath)
            if (indexPath == 14){
                let selectedTopic = dosagelist[tableview.indexPathForSelectedRow!.row]
                
                var seldosage = selectedTopic
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OtherTabletViewController") as UIViewController
                self.presentViewController(viewController, animated: false, completion: nil)
                
            }else{
                if segue.identifier == "selectedmedSegue" {
                let selectedTopic = medicinelist[tableview.indexPathForSelectedRow!.row]
                let selecteddosage = dosagelist[tableview.indexPathForSelectedRow!.row]
                var seldosage = selecteddosage
                    
                let vc = segue.destinationViewController as! SelectedTabltViewController
        
                  vc.TopicPassed = selectedTopic
                 Manager.DosageText = seldosage
                 print(seldosage)
        }
    }
}
        
    func loadDataFromFirebase() {
        
        
        databaseRef = FIRDatabase.database().reference().child("medication")
     
        databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
        for item in snapshot.children {
                
                if let name = item.value!!["tablet"] as? String
                {
                    print(name)
                    self.medicinelist.append(name)
                }
                if let dosage = item.value!!["dosage"] as? NSArray
                {
               // converting the array into string
                var dosageStr = dosage.description

       dosageStr = dosageStr.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil) // string without quotes

//                self.dosagelist.append(dosageStr)
                      dosageStr .enumerateSubstringsInRange(dosageStr .characters.indices,
                        options: .ByWords) {
                            (substring, _, _, _) -> () in
                           
                            self.dosagelist.append(substring!)
                            print(self.dosagelist.count)
                                               }
                }
                
            }
//            print(self.dosagelist)
            self.tableview.reloadData()
            
        })
    }
    
    }

        
        
        
        
        
        
        
        
        
        


