//
//  clinicianDetails.swift
//  medical-app
//
//  Created by Administrator on 28/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Clinician {
    var clinician:String!
    var Name:String!
    var email:String!
    var phno:String!
    var uid: String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    init(clinician: String,Name: String,email: String,phno: String,uid: String,key: String = ""){
        self.clinician = clinician
        self.Name = Name
        self.email = email
        self.phno = phno
        self.uid = uid
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        clinician = snapshot.value!["clinician"] as! String
        Name = snapshot.value!["Name"] as! String
        email = snapshot.value!["email"] as! String
        phno = snapshot.value!["phno"] as! String
        uid = snapshot.value!["uid"] as! String
        self.ref = snapshot.ref
        print(self.ref)
    }
    func toAnyObject() -> [String: AnyObject] {
        
             return ["clinician": clinician,"Name": Name,"email": email,"phno": phno,"uid":uid]
        
    }
}
