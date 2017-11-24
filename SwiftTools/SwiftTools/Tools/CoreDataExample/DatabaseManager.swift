//
//  DatabaseManager.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//

import Foundation
import CoreData

class DatabaseManager {
    // 品牌表
    static let brandTableName = "Brand"
    static let brandTableBrandName = "name"
    
    // 分组表
    static let groupTableName = "Group"
    static let groupTableGroupName = "name"
    
    // 设备表
    static let deviceTableName = "Device"
    
    static let defaultBrand: String! = "DefaultBrand"
    static let defaultGroup: String! = "DefaultGroup"
    static let defaultDevice: String! = "DefaultDevice"
    static var context: NSManagedObjectContext?
    
    class func getDatabaseContext() -> NSManagedObjectContext {
        // 1.获取实体模型路径
        guard let modelUrl = Bundle.main.url(forResource: "DeviceModel", withExtension: "momd") else{
            fatalError("Failed to find data model!")
        }
        
        // 2.创建对象管理模型
        guard let modelManager = NSManagedObjectModel(contentsOf: modelUrl) else {
            fatalError("Failed to create model object model!")
        }
        
        // 3.创建持久化对象
        let psc = NSPersistentStoreCoordinator(managedObjectModel: modelManager)
        
        // 4.创建数据库文件
        let dirUrl = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last
        let databaseFileUrl = URL(string: "DeviceModel.sql", relativeTo: dirUrl)
        
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: databaseFileUrl, options: nil)
        } catch {
            fatalError("Failed to create sqlite file!")
        }
        
        // 5.创建对象管理上下文
        if context == nil {
            context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            context?.persistentStoreCoordinator = psc
        }
        
        return context!
    }
    
    /// 获取指定条件的数据
    /// - parameter tableName: 表名
    /// - parameter colName: 列名称
    /// - parameter colVal: 列值
    ///
    /// - returns: 获取到的符合条件的数据
    class func getDataWithFromTableWithCol(tableName: String, colName: String?, colVal: String?) -> [Any] {
        let dataCoreContext = getDatabaseContext()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
        
        if colName != nil && colVal != nil {
            // 这里colname不能使用%格式化，会自动给列名添加""，那么筛选就不好使了
            fetch.predicate = NSPredicate(format: "\(colName!) == %@", colVal!)
        }
        
        do {
            let results = try dataCoreContext.fetch(fetch)
            
            return results;
        }catch{
            print("查询出错!\(error)")
        }
        
        return []
    }
}





























