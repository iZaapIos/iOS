//
//  Note+CoreDataProperties.swift
//  note taking
//
//  Created by Administrator on 30/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var date: String?
    @NSManaged var descrip: String?
    @NSManaged var content: String?

}
