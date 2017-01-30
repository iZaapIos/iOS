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
    @IBOutlet weak var freqlbl: UILabel!
    @IBOutlet weak var notificationlbl: UILabel?
    
    var databaseRef: FIRDatabaseReference!{
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to pass selected medication name to navigation
        self.navigationItem.title = TopicPassed
        
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
//        popoverPresentationViewController?.sourceView = Dosagelbl
//          popoverPresentationViewController?.sourceRect = CGRectMake(Dosagelbl.frame.width, Dosagelbl.frame.height*3, 0, 0)
        
        popoverPresentationViewController?.sourceView = Dosagelbl
        popoverPresentationViewController?.sourceRect = Dosagelbl.bounds
        presentViewController(popover!, animated: true, completion: nil)

   }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

    @IBAction func TabsSlider(sender: UISlider) {
        var TabValue = Int(sender.value)
        
        TabNoLbl.text = "\(TabValue)"
        
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
//        var medic = medlist(name: TopicPassed, dosage: Dosagelbl.text!, NoOfTab: TabNoLbl.text!, freq: freqlbl.text!, interval: IntervalLbl.text!)
        
//        print(medic)
        
//         let medic = MedicationDetails(name: TopicPassed, dosage: Dosagelbl.text!)
//        
        
        
//         medicArray.append(medic)
        
        
        
    }
        func SentDosage(data: String){
        
            print(data)
        Dosagelbl.text = data
    }

    @IBAction func alarmAction(sender: checkBox) {
        
        
        if sender.isChecked {
            
            print(notificationlbl!.text)
        } else {
           
            print("Unchecked")
        }
    }
    
    }
    



