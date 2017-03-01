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


struct  SummaryData{
    
    var pain_level: String!
    var remedies: String!
    var created_on: String!
    var comments: String!
    
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    init(pain_level: String, remedies: String, created_on: String, comments: String,key: String = ""){
        
        
        self.pain_level = pain_level
        self.remedies = remedies
        self.created_on = created_on
        self.comments = comments
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.pain_level = snapshot.value!["pain_level"] as! String
        self.remedies = snapshot.value!["remedies"] as! String
        self.created_on = snapshot.value!["created_on"] as! String
        self.comments = snapshot.value!["comments"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        
        return ["pain_level": pain_level, "remedies": remedies, "created_on": created_on, "comments": comments]
    }


}