//
//  UserDetails.swift
//  medical-app
//
//  Created by Administrator on 14/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct UserDetails{
    
    
    var uid : String!
    var username: String!
    var firstname:String!
    var lastname:String!
    var email:String!
    var phno:String!
    var password:String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
//    init(username: String,firstname: String,lastname: String,email: String,phno: String,key: String = ""){
    init(username: String,firstname: String,lastname: String,email: String,phno: String,password:String,key: String = ""){
    
    
//        self.uid = userId
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.phno = phno
        self.password = password
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
      
        self.username = snapshot.value!["username"] as! String
//        print(username)
        self.firstname = snapshot.value!["firstname"] as! String
//        print(firstname)
//        self.uid = snapshot.value!["uid"] as? String
        lastname = snapshot.value!["lastname"] as! String
        email = snapshot.value!["email"] as! String
        print(email)
        phno = snapshot.value!["phno"] as! String
        password = snapshot.value!["password"] as! String
        self.ref = snapshot.ref
        print(self.ref)
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        

        return ["username": username,"firstname": firstname,"lastname": lastname,"email": email,"phno": phno,"password": password]
//    return ["email": email]
        
    }
}
