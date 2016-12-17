//
//  RemedyViewController.swift
//  medical-app
//
//  Created by Administrator on 25/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class roughVC: UIViewController {
    
    var RateRev: String?
    var CmtRev: String?
    let medic = [medlist]()
   var remedyArray:[String] = ["","","","","",""]
    
//    //buttons utlets
//    
//    @IBOutlet weak var btn1: checkBox!
//    @IBOutlet weak var btn2: checkBox!
//    @IBOutlet weak var btn3: checkBox!
//    @IBOutlet weak var btn4: checkBox!
//    @IBOutlet weak var btn5: checkBox!
//    @IBOutlet weak var btn6: checkBox!
    
    
    //label outlets
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(RateRev)
//        print("loaded")
//        print(CmtRev)
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
         print(remedyArray)
        let remedyStr = remedyArray.description
        print(remedyStr)
        
    }


    @IBAction func btn1Action(sender: checkBox) {
        
        if sender.isChecked {
            remedyArray.removeAtIndex(0)
//            print(remedyArray)
            
        } else {

            remedyArray.insert(lbl1.text!, atIndex: 0)
//            print(remedyArray)
            
        }
        
    }
    
    
    @IBAction func btn2Action(sender: checkBox) {
        
        if sender.isChecked {
            remedyArray.removeAtIndex(1)
//            print(remedyArray)
            
        } else {
            remedyArray.insert(lbl2.text!,atIndex: 1)
//            print(remedyArray)
            
        }
    }
    
    @IBAction func btn3Action(sender: checkBox) {
        
        if sender.isChecked {
            remedyArray.removeAtIndex(2)
//            print(remedyArray)
        } else {
            remedyArray.insert(lbl3.text!,atIndex: 2)
//            print(remedyArray)
            
        }
    }
    
    @IBAction func btn4Action(sender: checkBox) {
        if sender.isChecked {
            remedyArray.removeAtIndex(3)
//            print(remedyArray)
            
        } else {
            remedyArray.insert(lbl4.text!,atIndex: 3)
//            print(remedyArray)
            
        }
    }
    
    
    @IBAction func btn5Action(sender: checkBox) {
        if sender.isChecked {
            remedyArray.removeAtIndex(4)
//            print(remedyArray)
            
        } else {
            remedyArray.insert(lbl5.text!,atIndex: 4)
//            print(remedyArray)
            
        }
    }
    
    @IBAction func btn6Action(sender: checkBox) {
        if sender.isChecked {
            remedyArray.removeAtIndex(5)
//            print(remedyArray)
            
        } else {
            remedyArray.insert(lbl6.text!,atIndex: 5)
//            print(remedyArray)
            
        }
    }
    
    
    @IBAction func SaveAction(sender: AnyObject)
    {
        
               
    }
}



//changes in this updation
//1.check box code (checkboxcell.swift,RemedyViewController.swift)
//2.user details code(UserDetailsViewController.swift)

//3. file name changed RemedyVc to RemedyViewController.swift
//4.old one is deleted.

// design wise
//5.added buttons on home page
//6.added buttons on medicationTableViewController
//7.
