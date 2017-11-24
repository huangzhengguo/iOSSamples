//
//  Device+CoreDataProperties.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var uuid: String?
    @NSManaged public var device_group: Group?

}
