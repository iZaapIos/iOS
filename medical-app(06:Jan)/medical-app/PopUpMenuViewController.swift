//
//  PopUpMenuTableViewController.swift
//  medical-app
//
//  Created by Administrator on 27/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class PopUpMenuViewController: UIViewController,  UIPopoverPresentationControllerDelegate {
    
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
         self.navigationController?.navigationBarHidden = true
        
    }
    
    
    
    @IBAction func LogOut(sender: AnyObject) {
    try! FIRAuth.auth()!.signOut()
    if let storyboard = self.storyboard {
        let vc = storyboard.instantiateViewControllerWithIdentifier("firstVC") as! FirstViewcontroller
        self.presentViewController(vc, animated: false, completion: nil)
       }
    }
    
   }
