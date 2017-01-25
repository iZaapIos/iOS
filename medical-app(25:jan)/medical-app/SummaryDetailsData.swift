//
//  SummaryDetailsData.swift
//  medical-app
//
//  Created by Administrator on 19/01/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase


struct  SummaryDetailsData{
    
    var pain_level: String!
    var remedies: String!
    var created_on: String!
    var comments: String!
    
    var dosage: String!
    var frequency: String!
    var interval: String!
    var reminder: String!
    var number_of_tablets: String!
    var tablet: String!
    
    var ref: FIRDatabaseReference?
    var key: String!
    
    
//    init(dosage: String, frequency: String, interval: String, reminder: String, number_of_tablets: String, tablet: String, pain_level: String, remedies: String, created_on: String, comments: String, key: String = ""){
        init(dosage: String, frequency: String, interval: String, reminder: String, number_of_tablets: String, tablet: String, key: String = ""){
        
//        self.pain_level = pain_level
//        self.remedies = remedies
//        self.created_on = created_on
//        self.comments = comments
        
        self.dosage = dosage
        self.frequency = frequency
        self.interval = interval
        self.reminder = reminder
        self.number_of_tablets = number_of_tablets
        self.tablet = tablet
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
//        self.pain_level = snapshot.value!["pain_level"] as! String
//        print(pain_level)
//        self.remedies = snapshot.value!["remedies"] as! String
//        print(remedies)
//        self.created_on = snapshot.value!["created_on"] as! String
//        print(created_on)
//        self.comments = snapshot.value!["comments"] as! String
        
        
        self.dosage = snapshot.value!["dosage"] as! String
        print(dosage)
        self.frequency = snapshot.value!["frequency"] as! String
        print(frequency)
        self.interval = snapshot.value!["interval"] as! String
        print(interval)
        self.reminder = snapshot.value!["reminder"] as! String
        self.number_of_tablets = snapshot.value!["number_of_tablets"] as! String
        self.tablet = snapshot.value!["tablet"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        
//        return ["pain_level": pain_level, "remedies": remedies, "created_on": created_on, "comments": comments, "dosage": dosage, "frequency": frequency, "interval": interval, "tablet": tablet, "reminder": reminder, "number_of_tablets": number_of_tablets]
        
        return ["dosage": dosage, "frequency": frequency, "interval": interval, "tablet": tablet, "reminder": reminder, "number_of_tablets": number_of_tablets]
    }
    
    
}