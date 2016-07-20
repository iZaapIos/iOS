//
//  Note+CoreDataProperties.swift
//  dairy
//
//  Created by Administrator on 18/07/16.
//  Copyright © 2016 Administrator. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var descrip: String?
    @NSManaged var content: String?
    @NSManaged var date: String?

}
