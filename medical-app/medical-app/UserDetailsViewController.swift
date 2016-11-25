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


class UserDetailsViewController: UIViewController {
    
    
    var user: UserDetails!
    
    
    @IBOutlet var Username: UITextField!
    
    @IBOutlet var Firstname: UITextField!
    @IBOutlet var Lastname: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phNo: UITextField!
    
    
    var databaseRef: FIRDatabaseReference!
    var  refHandle: UInt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
        let userRef = FIRDatabase.database().reference().child("users")
        userRef.observeEventType(.Value, withBlock: { (snapshot)  in
            
            for userInfo in snapshot.children {
                self.user = UserDetails(snapshot: userInfo as! FIRDataSnapshot)
                print(self.user)
            }
            if let user = self.user{
                self.Username.text = user.username
                self.Firstname.text = user.firstname
                self.Lastname.text = user.lastname
                 self.email.text = user.email
                 self.phNo.text = user.phno
            }
            
            
            
        })

        
    }
    
    

    
    
    
//    @IBAction func saveAction(sender: AnyObject) {
//        
//        //update the email section
//        if let user = FIRAuth.auth()?.currentUser {
//            
//            let credential = FIREmailPasswordAuthProvider.credentialWithEmail(email.text!,password: "")
//            
////            user.updateEmail(email.text!, completion: { (error) in
//            user?.reauthenticateWithCredential(credential) { error in
//                if let error = error{
//                    print(error.localizedDescription)
//                }else {
//                    let alertView = UIAlertView(title: "Update Email", message: "You have successfully updated your email", delegate: self, cancelButtonTitle: "OK, Thanks")
//                    alertView.show()
//                }
//            })
//            
//        }
//
//    }

        
    }




