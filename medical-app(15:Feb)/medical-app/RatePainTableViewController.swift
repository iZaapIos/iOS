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

class RatePainTableViewController: UITableViewController,UIPopoverPresentationControllerDelegate {
    
    var partlist = [BodyPartInfo]()
    
    
    var databaseRef: FIRDatabaseReference!
    var storageRef: FIRStorageReference!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
        storageRef = FIRStorage.storage().reference()
        loadDataFromFirebase()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(partlist.count)
        return partlist.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RatePainCell
        
        let body = partlist[indexPath.row]
        cell.PartName.text = body.part
        print(cell.PartName)
        
        if let ImageUrl = body.link {
            print(ImageUrl)
            let url = NSURL(string: ImageUrl)
            NSURLSession.sharedSession().dataTaskWithURL(url!,
                completionHandler: { (data, response, error) in
                    
                    // download hits an error
                    if error != nil {
                        print(error)
                        return
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        cell.PartsImage.image = UIImage(data:data!)
                        })
                }).resume()
            }
        return cell
    }
    
    
    //code to show a alert
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("ratepainPopup") as! RatePainPopUpViewController
        
        
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
    
    
    
     func loadDataFromFirebase() {
        

        databaseRef = FIRDatabase.database().reference().child("human_parts")
        
        databaseRef.observeEventType(.ChildAdded, withBlock: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
               let user = BodyPartInfo()

               user.setValuesForKeysWithDictionary(dictionary)
                self.partlist.append(user)
                
                print(self.partlist)
                
                //this will crash because of background thread, so lets use dispatch_async to fix
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
                
            } // if end
         
           }, withCancelBlock:nil)
      }

}
