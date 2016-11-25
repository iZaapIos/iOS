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



struct medlist {
    
    var name: String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
      init(name: String,key: String = ""){
    
        self.name = name
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        self.name = snapshot.value!["name"] as! String
        self.ref = snapshot.ref
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        
        return ["name": name]

    }
}

//class medlist: NSObject
//{
//    var name: String?
//    var key: String!
//}
