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
    var firstname:String!
    var lastname:String!
    var email:String!
    var phno:String!
    var password:String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    init(firstname: String,lastname: String,email: String,phno: String,password:String,key: String = ""){
    
    
//        self.uid = userId
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
      

        self.firstname = snapshot.value!["firstname"] as! String
        print(firstname)
        lastname = snapshot.value!["lastname"] as! String
        print(lastname)
        email = snapshot.value!["email"] as! String
        print(email)
        phno = snapshot.value!["phno"] as! String
        print(phno)
        password = snapshot.value!["password"] as! String
        print(password)
        self.ref = snapshot.ref
        print(self.ref)
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        

        return ["firstname": firstname,"lastname": lastname,"email": email,"phno": phno,"password": password]
        
    }
}
