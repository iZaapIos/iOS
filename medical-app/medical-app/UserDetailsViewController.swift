//
//  UserDetailsViewController.swift
//  medical-app
//
//  Created by Administrator on 14/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class UserDetailsViewController: UIViewController {
    
    @IBOutlet var Username: UITextField!
    
    @IBOutlet var Firstname: UITextField!
    @IBOutlet var Lastname: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phNo: UITextField!
    
    var user = [UserDetails]()
    
//    var databaseRef: FIRDatabaseReference! {
//        return FIRDatabase.database().reference()
//    }
    
    var databaseRef: FIRDatabaseReference!
    var storageRef: FIRStorage! {
        return FIRStorage.storage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
      
            
        if FIRAuth.auth()?.currentUser == nil {
                
       let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                presentViewController(vc, animated: true, completion: nil)
                }
        else {
            databaseRef = FIRDatabase.database().reference().child("users")
            
            
           databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
           var newItems = [UserDetails]()
            
           for child in snapshot.children
           {
//             let newNote = UserDetails(snapshot: child as! FIRDataSnapshot)
//              newItems.insert(newNote, atIndex: 0)
              var n = child.value!!["email"] as! String
                  self.email.text = n
            }
//               self.user = newItems
//                 print(self.user)
            
               })
        }
    }
    
    

    
    
    
    @IBAction func saveAction(sender: AnyObject) {
        
        //update the email section
        if let user = FIRAuth.auth()?.currentUser {
            
            user.updateEmail(email.text!, completion: { (error) in
                if let error = error{
                    print(error.localizedDescription)
                }else {
                    let alertView = UIAlertView(title: "Update Email", message: "You have successfully updated your email", delegate: self, cancelButtonTitle: "OK, Thanks")
                    alertView.show()
                }
            })
        }

    }




}


//            databaseRef = FIRDatabase.database().reference().child("users")
//
//
//            databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
//




//                    var newItems = [UserDetails]()
//
//                    for child in snapshot.children
//                    {
//                        let newNote = UserDetails(snapshot: child as! FIRDataSnapshot)
//                        newItems.insert(newNote, atIndex: 0)
////                    let n = child.value!!["username"] as! String
////                    print(n)
//                    }
//                    self.user = newItems
//                    print(self.user)
//
//                }

