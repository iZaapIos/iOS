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


protocol DataSentDelegate{
    func SentDosage(data: String)
}

class DosagePopUpTableViewController: UITableViewController {
    
    var DosagePassed : String!
    var DosageArr : [String]?
    
    var delegate: DataSentDelegate? = nil

    @IBOutlet var tableview: UITableView!
    var databaseRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBarHidden = true
        DosagePassed = Manager.DosageText
        print(DosagePassed)
        DosageArr = DosagePassed.componentsSeparatedByString(",")
        

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
    return DosageArr!.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DosageTableCell
        cell.Dosagelbl.text = DosageArr![indexPath.row]
      return cell
    }
    
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let seldosage = DosageArr![tableview.indexPathForSelectedRow!.row]
     print(seldosage)
        if delegate != nil {
             let data = seldosage
            delegate?.SentDosage(data)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    

}

        






        
//        databaseRef = FIRDatabase.database().reference().child("medication")
//        
//        
//
//        let myRef = self.databaseRef.childByAppendingPath("dosage")
//        print(myRef)
////        myRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
//        myRef.queryOrderedByChild("dosage").observeSingleEventOfType(.ChildAdded, withBlock: { snapshot in
//            
//            let a = snapshot.value as! NSArray
//            print(a)
//            
//            let b = (a as Array).filter {$0 is String}
//            
//            print(b)
//        })
//        
//        
//        
//        
        
        
        
        
        
        
        
        
        
//        databaseRef.queryOrderedByChild("dosage").observeEventType(.ChildAdded, withBlock: { snapshot in
//            
//            for item in snapshot.children{
//               
//                    if let title = snapshot.value!["dosage"] as? String {
//                        
//                        print(title)
//                        self.titlesArray.append(title)
//                        
//                        // Double-check that the correct data is being pulled by printing to the console.
//                        print("\(self.titlesArray)")
//                        
//                        
//                        
//                        // async download so need to reload the table that this data feeds into.
//                      
//                        self.tableView.reloadData()
//                    }
//                 }
//            
//               })
        
//         }

    


