//
//  UserRegister.swift
//  medical-app
//
//  Created by Administrator on 12/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

struct UserInfo {
    
    var storyboard: UIStoryboard?
        var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    
    
    // 3 --- Saving the user Info in the database
    private func saveInfo(user: FIRUser!, username: String, password: String, firstname: String, lastname: String,phno: String){
        
        // Create our user dictionary info\
        
        let userInfo = ["email": user.email!, "username": username,"password":password ,"firstname": firstname, "lastname":lastname, "phno": phno]
        
        // create user reference
        
        let userRef = databaseRef.child("users").childByAutoId()
        
        // Save the user info in the Database
        
        userRef.setValue(userInfo)
        
        
        // Signing in the user
        signIn(user.email!, password: password)
        
    }
    
    
    // 4 ---- Signing in the User
    func signIn(email: String, password: String){
        
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
            if error == nil {
                print ("no error")
                if let user = user {
                    
                    print("\(user.displayName!) has signed in succesfully!")
                }

                
            }else {
                
                print(error!.localizedDescription)
                
                let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)

                let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                alertController.addAction(defaultAction)


                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
               
                
                   }
             })
        
    }
    
    // 2 ------ Set User Info
    
    private func setUserInfo(user: FIRUser!,  username: String, password: String,firstname: String, lastname: String,phno: String){
        
        
        let imageRef = storageRef.child("users")
        
        let changeRequest = user.profileChangeRequest()
        changeRequest.displayName = username
        changeRequest.commitChangesWithCompletion({ (error) in
                    
                    if error == nil {
                        
                        self.saveInfo(user, username: username, password: password, firstname: firstname, lastname:lastname, phno: phno)
                        
                    }else{
//                        print(error!.localizedDescription)

                        let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        
                        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
                        

                    }
                })
        
        }
        
    
    // Reset Password
    func resetPassword(email: String){
        FIRAuth.auth()?.sendPasswordResetWithEmail(email, completion: { (error) in
            if error == nil {
                print("An email with information on how to reset your password has been sent to you. thank You")
            }else {
//                print(error!.localizedDescription)

                let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
                

            }
        })
        
    }
    
    // 1 ---- We create the User
    
    func signUp(email: String, username: String, password: String,firstname: String, lastname: String,phno: String){
        
           FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
            
            if error == nil {
//                self.prepareSegueWithIdentifier("registeredin",sender:nil)
                //aunthenticate the user
                FIREmailPasswordAuthProvider.credentialWithEmail(email, password: password)
                self.setUserInfo(user, username: username,  password: password, firstname:firstname, lastname:lastname, phno: phno)
                
            }else {
                let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
            
                
            }
        })
        
    
    
     }
    
    //segue Funtion
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "registeredin" {
//
//            let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("logmedVC") as UIViewController
//             UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(viewController, animated: true, completion: nil)
//            
//        } else if segue.identifier == "loggedin" {
//            let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("logmedVC") as UIViewController
//            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(viewController, animated: true, completion: nil)
//        }
//    }
    
    func moveToLogMed()
    {
//        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("logmedVC") as UIViewController
//        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(viewController, animated: true, completion: nil)
        
        var segue: UIStoryboardSegue!
    
    if segue.identifier == "registeredin" {
    
    let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("logmedVC") as UIViewController
    UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(viewController, animated: true, completion: nil)
    
    } else if segue.identifier == "loggedin" {
    let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("logmedVC") as UIViewController
    UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(viewController, animated: true, completion: nil)
    }



    }
    
}


