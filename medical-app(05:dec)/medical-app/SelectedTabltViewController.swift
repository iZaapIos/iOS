//
//  SelectedTabltViewController.swift
//  medical-app
//
//  Created by Administrator on 10/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectedTabltViewController: UIViewController,UIPopoverPresentationControllerDelegate, DataSentDelegate{
    
    var TopicPassed:String!
    var popover: DosagePopUpTableViewController? = nil
   
    @IBOutlet  var Dosagelbl: UILabel!
    @IBOutlet weak var IntervalLbl: UILabel!
    @IBOutlet weak var TabNoLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var freqlbl: UILabel!
    let medDetails = MedicationDetails()
    
    
    var databaseRef: FIRDatabaseReference!{
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to pass selected medication name to navigation
        self.navigationItem.title = TopicPassed
        
        
        //stepper functions
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        
      
        //label clickable
        Dosagelbl.userInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("labelPressed"))
        Dosagelbl.addGestureRecognizer(gestureRecognizer)

        }
    
    func labelPressed(){
    
    
//    let VC = storyboard?.instantiateViewControllerWithIdentifier("PopUpSelectedTabVC") as! DosagePopUpTableViewController
//    VC.preferredContentSize = CGSize(width:200 , height: 250)
//    let navController = UINavigationController(rootViewController:
//        VC)
       //
//        
//    navController.modalPresentationStyle = UIModalPresentationStyle.Popover
//    
//    
//    //code to define popoverViewController
//    let popOver = navController.popoverPresentationController
//    
//    popOver?.delegate = self
//    popOver?.sourceView = Dosagelbl
//    popOver?.sourceRect = Dosagelbl.bounds
////    popOver?.sourceRect = CGRectMake(Dosagelbl.frame.width, Dosagelbl.frame.height*3, 0, 0)
//    
//    //present popOver
//    self.presentViewController(navController, animated: true, completion: nil)
        
        
           popover = self.storyboard?.instantiateViewControllerWithIdentifier("PopUpSelectedTabVC") as! DosagePopUpTableViewController
        popover!.modalPresentationStyle = .Popover
//        popover!.preferredContentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 250)
        popover!.preferredContentSize = CGSize(width:100 , height: 250)
        popover!.delegate = self
        let popoverPresentationViewController = popover!.popoverPresentationController
//        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Any
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = Dosagelbl
        popoverPresentationViewController?.sourceRect = Dosagelbl.frame
//        let position = CGRectMake(aView.bounds.origin.x, aView.bounds.origin.y + 125, aView.bounds.size.width, aView.bounds.size.height)
//        popoverPresentationViewController?.sourceRect = Dosagelbl.bounds
        
        presentViewController(popover!, animated: true, completion: nil)

   }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

    
    @IBAction func stepperAction(sender: UIStepper) {
        TabNoLbl.text = Int(sender.value).description
    }
    

    @IBAction func IntervalSlider(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        
        IntervalLbl.text = "\(currentValue)"
    }
    
    
    @IBAction func FreqSlider(sender: UISlider) {
        
        var currentVal = Int(sender.value)
        
        freqlbl.text = "\(currentVal)"
    }
    
    @IBAction func SaveMed(sender: AnyObject) {
        
//        let medRef = databaseRef.child("MedicationDetails").child("medicine").childByAutoId()
////
        let medic = medlist(name: TopicPassed, dosage: Dosagelbl.text!, NoOfTab: TabNoLbl.text!, freq: freqlbl.text!, interval: IntervalLbl.text!)
        
        print(medic)
        
        
//         medRef.setValue(medic.toAnyObject())
//
//        //alert action
//     let alertController = UIAlertController(title: "Success", message: "Medication Added Successfully", preferredStyle: .Alert)
//        
//        let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
//       alertController.addAction(defaultAction)
        

        
//        medDetails.setMedInfo(TopicPassed, dosage: Dosagelbl.text!, NoOfTab: TabNoLbl.text!, freq:freqlbl.text!, interval: IntervalLbl.text!)
        
//        var storyboard = UIStoryboard(name: "Main", bundle: nil)
//        var controller = storyboard.instantiateViewControllerWithIdentifier("remedyVC") as! RemedyViewController
        
                
//        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    func SentDosage(data: String){
        
        Dosagelbl.text = data
    }

    
    }
    



