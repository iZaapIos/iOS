//
//  Entity+CoreDataProperties.swift
//  coreData_sam
//
//  Created by Administrator on 08/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entity {

    @NSManaged var name: String?
    @NSManaged var dept: String?
    @NSManaged var address: String?

}
