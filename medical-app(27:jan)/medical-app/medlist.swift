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
    var tablet: String!
    var ref: FIRDatabaseReference?
    var key: String!
    var NoOfTab : String!
    var freq : String!
    var interval : String!
    var emptyDict = [String: String]()
    
    //juz assigning the values to the array
    init(tablet: String,dosage: String,NoOfTab: String,freq: String,interval: String,key: String = ""){
        
        self.dosage = dosage
        print(dosage)
        self.NoOfTab = NoOfTab
        self.freq = freq
        self.tablet = tablet
         print(tablet)
        self.interval = interval
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.key = snapshot.key
        self.tablet = snapshot.value!["tablet"] as! String
        print(tablet)
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
        
        return ["tablet": tablet, "dosage": dosage,"NoOfTab": NoOfTab,"freq": freq,"interval": interval]
        
  }
     private mutating func dict(name: String){
        
        emptyDict = ["name": name]
        print(emptyDict)
    }

    

}

