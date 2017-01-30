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
    var dosage: String!
    var frequency: String!
    var interval: String!
    var reminder: String!
    var number_of_tablets: String!
    var tablet: String!
    
    var ref: FIRDatabaseReference?
    var key: String!
    

    init(dosage: String, frequency: String, interval: String, reminder: String, number_of_tablets: String, tablet: String, key: String = ""){
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
        
        
        self.dosage = snapshot.value!["dosage"] as! String
        self.frequency = snapshot.value!["frequency"] as! String
        self.interval = snapshot.value!["interval"] as! String
        self.reminder = snapshot.value!["reminder"] as! String
        self.number_of_tablets = snapshot.value!["number_of_tablets"] as! String
        self.tablet = snapshot.value!["tablet"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        
        return ["dosage": dosage, "frequency": frequency, "interval": interval, "tablet": tablet, "reminder": reminder, "number_of_tablets": number_of_tablets]
    }
    
    
}