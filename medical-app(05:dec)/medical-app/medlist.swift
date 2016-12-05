//
//  medlist.swift
//  medical-app
//
//  Created by Administrator on 24/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase



struct medlist{
    
    var dosage: String
    var name: String!
    var ref: FIRDatabaseReference?
    var key: String!
    var NoOfTab : String!
    var freq : String!
    var interval : String!
    
    
    init(name: String,dosage: String,NoOfTab: String,freq: String,interval: String,key: String = ""){
        
        self.dosage = dosage
        print(dosage)
        self.NoOfTab = NoOfTab
        self.freq = freq
        self.name = name
         print(name)
        self.interval = interval
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        self.name = snapshot.value!["name"] as! String
        print(name)
        self.dosage = snapshot.value!["dosage"] as! String
        print(dosage)
        self.NoOfTab = snapshot.value!["NoOfTab"] as! String
        print(NoOfTab)
        self.freq = snapshot.value!["freq"] as! String
        print(freq)
        self.interval = snapshot.value!["interval"] as! String
        print(interval)
        self.ref = snapshot.ref
        
        
    }
    func toAnyObject() -> [String: AnyObject] {
        
        return ["name": name, "dosage": dosage,"NoOfTab": NoOfTab,"freq": freq,"interval": interval]
  }
    func medInfo(name: String,dosage: String,NoOfTab: String,freq: String,interval: String)
    {
//        print(name,dosage: dosage,NoOfTab: NoOfTab,freq: freq,interval: interval)
    print(name)
    }
}

