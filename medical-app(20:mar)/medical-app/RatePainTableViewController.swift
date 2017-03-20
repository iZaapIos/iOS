//
//  RatePainTableViewController.swift
//  medical-app
//
//  Created by Administrator on 11/02/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class RatePainTableViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var collectnView: UICollectionView!
    var parts = ["ankle","arm","chest","ear","elbow","eye","finger","foot","forhead","hair","hand","knee","leg","mouth","neck","nose","shoulder","stomach","tooth"] as NSMutableArray

    
//    var selectedParts = NSMutableArray()
    var selectedParts = ["no"] as NSMutableArray
   
    var remedyStr: String = " "
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
    
        
       }
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let  contact = parts.objectAtIndex(indexPath.row)
        
        let cell:RatePainCell = (collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! RatePainCell)
        
        
        cell.button.addTarget(self, action: "tickClicked:",forControlEvents: UIControlEvents.TouchUpInside)
        cell.tick.addTarget(self, action: "tickClicked:",forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.partLbl.text = parts[indexPath.row] as! String
       
        cell.button.setBackgroundImage(UIImage(named: parts[indexPath.row] as! String), forState: UIControlState.Normal)
        
        cell.button.tag = indexPath.row
        cell.tick.tag = indexPath.row
        
        if selectedParts.containsObject(parts.objectAtIndex(indexPath.row))
        {

            cell.tick.hidden = false
        }
        else{
            
            cell.tick.hidden = true
        }

        return cell
    }
    
    func tickClicked(sender: UIButton!)
    {
        let value = sender.tag;
        
        
    if selectedParts.containsObject(parts.objectAtIndex(value))
        {
            selectedParts.removeObject(parts.objectAtIndex(value))
            
            
        }
        else
        {
         selectedParts.replaceObjectAtIndex(0, withObject: parts.objectAtIndex(value))
            print(selectedParts)
            
        }
        
        remedyStr = selectedParts.description // converting the array into string
        remedyStr = remedyStr.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil) // string without quotes
        popUP()
        
        collectnView.reloadData()

    }
    
    func popUP() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("ratepainPopup") as! RatePainPopUpViewController
        
        controller.part = remedyStr
        
        controller.modalPresentationStyle = UIModalPresentationStyle.Popover
        controller.preferredContentSize = CGSize(width:300 , height: 280)
        
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
    
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width/3.0 - 8, height: collectionView.frame.size.width/2.0 - 8)
//    }.
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
        {
            return .None
        }
    
    
   }




