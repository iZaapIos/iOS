
//
//  Note.swift
//  Progress-App
//
//  Created by Administrator on 14/09/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase



struct Note {
    
    var title: String!
    var content: String!
    var date: String!
    
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    init(title: String, content: String, date: String, key: String = ""){
        
        
        self.title = title
        self.content = content
        self.date = date
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot){
        
        self.title = snapshot.value!["title"] as! String
        self.content = snapshot.value!["content"] as! String
        self.date = snapshot.value!["date"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        
        return ["title": title, "content": content, "date": date ]
}
}

