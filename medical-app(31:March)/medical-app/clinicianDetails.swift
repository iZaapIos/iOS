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
    var clinician_type:String!
    var name:String!
    var email:String!
    var phone:String!
    var user_id: String!
    var ref: FIRDatabaseReference?
    var key: String!
    init() { }
    
    
    init(clinician_type: String,name: String,email: String,phone: String,user_id: String,key: String = ""){
        self.clinician_type = clinician_type
        self.name = name
        self.email = email
        self.phone = phone
        self.user_id = user_id
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        clinician_type = snapshot.value!["clinician_type"] as! String
        name = snapshot.value!["name"] as! String
        email = snapshot.value!["email"] as! String
       phone = snapshot.value!["phone"] as! String
       user_id = snapshot.value!["user_id"] as! String
        self.ref = snapshot.ref
        print(self.ref)
    }
    func toAnyObject() -> [String: AnyObject] {
        
             return ["clinician_type": clinician_type,"name": name,"email": email,"phone": phone,"user_id":user_id]
        
    }
}
