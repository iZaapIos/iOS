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

class RequestClinicianViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var displayLabel: UILabel!
    var popover: PopUpRequestClinViewController? = nil
    
    var clinArray = [Clinician]()

    @IBOutlet weak var addButton: UIButton!
    var databaseRef: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
           HideButton()    
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadDataFromFirebase()
        HideButton()


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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ClinicianCell
         cell.clinician.text = clinArray[indexPath.row].clinician_type
         cell.clinName.text = clinArray[indexPath.row].name
        cell.clinEmail.text = clinArray[indexPath.row].email
         cell.clinPh.text = clinArray[indexPath.row].phone
         return cell
    }
    
    //code to show a alert
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("popup") as! PopUpRequestClinViewController
        controller.modalPresentationStyle = UIModalPresentationStyle.Popover
         controller.preferredContentSize = CGSize(width:300 , height: 250)
        
        let popoverPresentationController = controller.popoverPresentationController
        
        
        if let popoverPresentationViewController = popoverPresentationController {
            
            // set the view from which to pop up
            popoverPresentationViewController.sourceView = self.view
            
            popoverPresentationViewController.delegate = self
            popoverPresentationViewController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds),0,0)
            popoverPresentationViewController.permittedArrowDirections = UIPopoverArrowDirection()
            
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            let ref = clinArray[indexPath.row].ref
            ref!.removeValue()
            clinArray.removeAtIndex(indexPath.row)
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
             HideButton()
        }
    }
    
    func loadDataFromFirebase()
    {
        //to check clinician info count
       var u_id = FIRAuth.auth()?.currentUser!.uid
        databaseRef = FIRDatabase.database().reference().child("clinician_details")
        
        databaseRef.queryOrderedByChild("user_id").queryEqualToValue(u_id).observeEventType(.Value, withBlock: { (snapshot) in
      
            
            var newItems = [Clinician]()
            
            for item in snapshot.children {
                
                let newClin = Clinician(snapshot: item as! FIRDataSnapshot)
                newItems.append(newClin)
            }
            
            self.clinArray = newItems
            self.HideButton()
            self.tableview.reloadData()
            })
            {
                (error) in
                print(error.localizedDescription)
            }
        
       }
    
    func HideButton()
    {
        
        if clinArray.count >= 5 {
            print("array reached 5 entries")
            addButton.hidden = true
        }else{
            print("array not reached 5 entries yet")
             addButton.hidden = false
        }
    }

    
    
}
