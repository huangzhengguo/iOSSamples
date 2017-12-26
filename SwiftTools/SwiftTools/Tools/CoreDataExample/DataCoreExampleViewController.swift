//
//  DataCoreExampleViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit
import CoreData

class DataCoreExampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var datasourceDic: [String: Array<Device>] = [String: Array<Device>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareData()
        setViews()
    }

    func prepareData() -> Void {
        // 1.获取品牌数据
        let brands = DatabaseManager.getDataWithFromTableWithCol(tableName: DatabaseManager.brandTableName, colName: DatabaseManager.brandTableBrandName, colVal: DatabaseManager.defaultBrand)
        
        if brands.count == 0 {
            print("没有数据!")
            return
        }
        // 2.获取分组信息
        let brand = brands.first as! Brand
        let groups = brand.brand_group?.sorted(by: {UIContentSizeCategory(rawValue: ($0 as! Group).name!) > UIContentSizeCategory(rawValue: ($1 as! Group).name!)})
        for g in groups! {
            let group = g as! Group
            
            // 3.构建设备信息数据源
            var deviceArray: [Device] = [Device]().sorted(by: {UIContentSizeCategory(rawValue: ($0 ).name!) > UIContentSizeCategory(rawValue: ($1 ).name!)})
            for d in group.group_device! {
                let device = d as! Device
                
                deviceArray.append(device)
            }
            
            datasourceDic[group.name!] = deviceArray
        }
        
        tableView.reloadData()
    }
    
    func setViews() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let addDeviceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDevice))
        
        self.navigationItem.rightBarButtonItems = [addDeviceBarButtonItem]
    }
    
    
    /// 增加设备
    ///
    /// - returns: Void
    @objc func addDevice() -> Void {
        let context = DatabaseManager.getDatabaseContext()
        let brands = DatabaseManager.getDataWithFromTableWithCol(tableName: DatabaseManager.brandTableName, colName: DatabaseManager.brandTableBrandName, colVal: DatabaseManager.defaultBrand)
        var defaultBrand: Brand?
        var defaultGroup: Group?
        if brands.count == 0 {
            print("没有数据")
            // 1.新建默认品牌
            defaultBrand = NSEntityDescription.insertNewObject(forEntityName: DatabaseManager.brandTableName, into: context) as? Brand
            
            defaultBrand?.name = DatabaseManager.defaultBrand
            
            // 2.新建默认分组
            defaultGroup = NSEntityDescription.insertNewObject(forEntityName: DatabaseManager.groupTableName, into: context) as? Group
            
            defaultGroup?.name = DatabaseManager.defaultGroup
            
            defaultBrand?.addToBrand_group(defaultGroup!)
        } else {
            // 存在的话取第一个就好
            defaultBrand = (brands.first as! Brand)
            
            defaultGroup = defaultBrand?.brand_group?.first(where: {($0 as! Group).name == DatabaseManager.defaultGroup}) as? Group
        }
        
        let defaultDevice: Device! = NSEntityDescription.insertNewObject(forEntityName: DatabaseManager.deviceTableName, into: context) as! Device
        
        defaultDevice.name = DatabaseManager.defaultDevice
        
        defaultGroup?.addToGroup_device(defaultDevice)
        
        do {
            try context.save()
        } catch{
            print("增加数据出错！")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasourceDic.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let deviceArray = getDevice(section: section)
        return deviceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let device = getDevice(section: indexPath.section)[indexPath.row]
        
        cell?.textLabel?.text = device.name
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func getDevice(section: Int) -> Array<Device> {
        let keys = datasourceDic.keys.reversed()
        
        return datasourceDic[keys[section]]!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
