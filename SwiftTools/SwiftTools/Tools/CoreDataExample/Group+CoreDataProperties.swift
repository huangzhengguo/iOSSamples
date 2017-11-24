//
//  Group+CoreDataProperties.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var group_brand: Brand?
    @NSManaged public var group_device: NSSet?

}

// MARK: Generated accessors for group_device
extension Group {

    @objc(addGroup_deviceObject:)
    @NSManaged public func addToGroup_device(_ value: Device)

    @objc(removeGroup_deviceObject:)
    @NSManaged public func removeFromGroup_device(_ value: Device)

    @objc(addGroup_device:)
    @NSManaged public func addToGroup_device(_ values: NSSet)

    @objc(removeGroup_device:)
    @NSManaged public func removeFromGroup_device(_ values: NSSet)

}
