//
//  medicationDetails.swift
//  medical-app
//
//  Created by Administrator on 01/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
    
struct MedicationDetails {
        
        var storyboard: UIStoryboard?
        var databaseRef: FIRDatabaseReference! {
            return FIRDatabase.database().reference()
        }
        
        var storageRef: FIRStorageReference {
            return FIRStorage.storage().reference()
        }
    
    
//    // 3 --- Saving the user Info in the database
//    private func saveInfo(user: FIRUser!, username: String, password: String, firstname: String, lastname: String,phno: String){
//        
//        // Create our user dictionary info\
//        
//        let userInfo = ["email": user.email!, "username": username,"password":password ,"firstname": firstname, "lastname":lastname, "phno": phno]
//        
//        // create user reference
//        
//        let userRef = databaseRef.child("users").childByAutoId()
//        
//        // Save the user info in the Database
//        
//        userRef.setValue(userInfo)
    
        
              
   // }
    
    // calls 1
     func setMedInfo(name: String, dosage: String, NoOfTab: String, freq: String, interval: String)
    {
        self.saveMedInfo(name, dosage:dosage, NoOfTab:NoOfTab, freq:freq, interval:interval)
        

        
    }
    //class 2
     func saveMedInfo(name: String, dosage: String, NoOfTab: String, freq: String, interval: String)
     {
      
        let medInfo = ["name":name, "dosage":dosage, "NoOfTab":NoOfTab, "freq":freq, "interval":interval]
        
//         create user reference
        
        let userRef = databaseRef.child("medicationDetails").child("medicine").childByAutoId()
        
        // Save the user info in the Database
        
        userRef.setValue(medInfo)

        
    }
    func setRemedyInfo(rate: String, Comments: String, DrinWat: String, HeatPad: String, Shwr: String,
        Temp: String, Nap: String, TkMed: String)
    {
        
        
    }
}
