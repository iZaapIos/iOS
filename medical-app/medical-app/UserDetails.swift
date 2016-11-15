//
//  UserDetails.swift
//  medical-app
//
//  Created by Administrator on 14/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

struct UserDetails {
    
    var username: String!
    var firstname:String!
    var lastname:String!
    var email:String!
    var phno:String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    init(username: String,firstname: String,lastname: String,email: String,phno: String,key: String = ""){
        
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.phno = phno
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        key = snapshot.key
        username = snapshot.value!["username"] as! String
        firstname = snapshot.value!["firstname"] as! String
        lastname = snapshot.value!["lastname"] as! String
        email = snapshot.value!["email"] as! String
        phno = snapshot.value!["phno"] as! String
        ref = snapshot.ref
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        
        return ["username": username,"firstname": firstname,"lastname": lastname,"email": email,"phno": phno]
        
    }
}
