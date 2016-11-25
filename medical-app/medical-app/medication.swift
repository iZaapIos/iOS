//
//  medication.swift
//  medical-app
//
//  Created by Administrator on 04/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct medication {
    
    var dosage: String
    var name: String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    init(name: String,dosage: String,key: String = ""){
    
        self.dosage = dosage
        self.name = name
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        self.name = snapshot.value!["name"] as! String
        self.dosage = snapshot.value!["dosage"] as! String
        self.ref = snapshot.ref
    
        
    }



}

