//  LogMedViewcontroller.swift
//  medical-app
//
//  Created by Administrator on 21/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//


import UIKit
import Firebase

class LogMedViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
   
    
   // action to popover the menu view controller
    @IBAction func menuButton(sender: AnyObject)
    {
     
        let VC = storyboard?.instantiateViewControllerWithIdentifier("PopUpVC") as! PopUpMenuViewController
        VC.preferredContentSize = CGSize(width:200 , height: 350)
        let navController = UINavigationController(rootViewController:
            VC)
        navController.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        //code to define popoverViewController
        let popOver = navController.popoverPresentationController
        popOver?.delegate = self
        popOver?.barButtonItem = sender as! UIBarButtonItem
        
        //present popOver
        self.presentViewController(navController, animated: true, completion: nil)
        
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
        
}

