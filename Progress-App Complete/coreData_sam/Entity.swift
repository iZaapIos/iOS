//
//  Entity.swift
//  coreData_sam
//
//  Created by Administrator on 08/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation
import CoreData

@objc(Entity)
class Entity: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var address: String
    @NSManaged var designation: String

}
