//
//  Brand+CoreDataProperties.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension Brand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brand> {
        return NSFetchRequest<Brand>(entityName: "Brand")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var brand_group: NSSet?

}

// MARK: Generated accessors for brand_group
extension Brand {

    @objc(addBrand_groupObject:)
    @NSManaged public func addToBrand_group(_ value: Group)

    @objc(removeBrand_groupObject:)
    @NSManaged public func removeFromBrand_group(_ value: Group)

    @objc(addBrand_group:)
    @NSManaged public func addToBrand_group(_ values: NSSet)

    @objc(removeBrand_group:)
    @NSManaged public func removeFromBrand_group(_ values: NSSet)

}
