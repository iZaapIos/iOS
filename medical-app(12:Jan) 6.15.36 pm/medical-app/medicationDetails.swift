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
    
//struct MedicationDetails {
//    var medication: [String:String]
//    
//     func dict(name: String,dosage: String,NoOfTab: String,freq: String,interval: String){
//    
//        var emptyDict: [String:String] = ["name":name,"dosage":dosage,"NoOfTab":NoOfTab,"freq":freq,"interval":interval]
//        print(emptyDict)
//        
//        
//    }

//}


struct  MedicationDetails
{
    var name = "prodname"
    var dosage = "blank"
//    var medicArray: [MedicationDetails]=[MedicationDetails]()
    
    init(name:String,dosage:String)
    {
        self.name=name
        self.dosage=dosage
    }
    
//     mutating func setUp(name:String,dosage:String)
//    {
//        
//        let medic = MedicationDetails(name:name,dosage:dosage)
//        medicArray.append(medic)
//        
//    }
    
 
}