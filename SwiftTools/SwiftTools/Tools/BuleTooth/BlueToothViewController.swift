//
//  BlueToothViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/3/16.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit
import CoreBluetooth

class BlueToothViewController: UIViewController, CBCentralManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var dataSource: Array<CBPeripheral> = Array()
    var centralManager: CBCentralManager?
    var scanBarButtonItem: UIBarButtonItem?
    var isScan: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
        print(self.tableView.frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 1.创建中心设备管理对象
        centralManager = CBCentralManager.init(delegate: self, queue: nil, options: nil)
        
        scanBarButtonItem = UIBarButtonItem.init(title: "扫描", style: .plain, target: self, action: #selector(scanPeripheral))
        self.navigationItem.rightBarButtonItem = self.scanBarButtonItem;
    }
    
    @objc func scanPeripheral() -> Void {
        if isScan {
            scanBarButtonItem?.title = "扫描"
            centralManager?.stopScan()
        } else {
            centralManager?.scanForPeripherals(withServices: nil, options: nil)
            scanBarButtonItem?.title = "停止"
        }
        
        isScan = !isScan
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("创建中心管理对象成功！")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("发现设备: ", peripheral.name ?? "没有名字")
        print(RSSI)
        if (advertisementData.keys.contains("kCBAdvDataManufacturerData")) {
            print(advertisementData.index(forKey: "kCBAdvDataManufacturerData")!)
        }
        
        if (!self.dataSource.contains(peripheral)) {
            self.dataSource.append(peripheral)
        }
        
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        let peripheral = self.dataSource[indexPath.row]
        
        cell?.textLabel?.text = peripheral.name
        
        return cell!
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
        print(self.tableView.frame)
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
