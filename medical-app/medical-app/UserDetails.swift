//
//  UserDetails.swift
//  medical-app
//
//  Created by Administrator on 14/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct UserDetails {
    
    
    var uid : String!
    var username: String!
    var firstname:String!
    var lastname:String!
    var email:String!
    var phno:String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    init(username: String,firstname: String,lastname: String,email: String,phno: String,userId: String,key: String = ""){
    
    

    
        self.uid = userId
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.phno = phno
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        print(self.key)
        self.username = snapshot.value!["username"] as! String
        self.firstname = snapshot.value!["firstname"] as! String
        self.uid = snapshot.value!["uid"] as? String
        lastname = snapshot.value!["lastname"] as! String
        email = snapshot.value!["email"] as! String
        phno = snapshot.value!["phno"] as! String
        self.ref = snapshot.ref
        print(self.ref)
        
        
    }
    
//    func toAnyObject() -> [String: AnyObject] {
//        
////        return ["username": username,"firstname": firstname,"lastname": lastname,"email": email,"phno": phno]
//        return ["username": username,"firstname": firstname,]
//        
//    }
}
