//
//  SelectedTabltViewController.swift
//  medical-app
//
//  Created by Administrator on 10/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class SelectedTabltViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
    var TopicPassed:String!
    
    
//    @IBOutlet weak var NavBar: UINavigationBar!
     @IBOutlet  var Dosagelbl: UILabel!
    @IBOutlet weak var IntervalLbl: UILabel!
    @IBOutlet weak var TabNoLbl: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)


    }
    
    func labelPressed(){
    
    
    let VC = storyboard?.instantiateViewControllerWithIdentifier("PopUpSelectedTabVC") as! DosagePopUpTableViewController
    VC.preferredContentSize = CGSize(width:200 , height: 250)
    let navController = UINavigationController(rootViewController:
        VC)
    
    print("Label pressed")
    
    navController.modalPresentationStyle = UIModalPresentationStyle.Popover
    
    //code to define popoverViewController
    let popOver = navController.popoverPresentationController
    popOver?.delegate = self
    
        popOver?.sourceView = Dosagelbl
        popOver?.sourceRect = Dosagelbl.bounds
//    popOver?.sourceRect = CGRectMake(Dosagelbl.frame.width, Dosagelbl.frame.height*3, 0, 0)
    
    //present popOver
    self.presentViewController(navController, animated: true, completion: nil)
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

    
    @IBAction func stepperAction(sender: UIStepper) {
        TabNoLbl.text = Int(sender.value).description
    }
    

    @IBAction func SliderAction(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        
        IntervalLbl.text = "\(currentValue)"
    }
}
