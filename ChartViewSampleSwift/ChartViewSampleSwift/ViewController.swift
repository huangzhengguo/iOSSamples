//
//  ViewController.swift
//  ChartViewSampleSwift
//
//  Created by huang zhengguo on 2017/8/14.
//  Copyright © 2017年 huang zhengguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var titleDataSource:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        titleDataSource = ["PNChart"]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell.isEqual(nil){
           cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        
        let titltStr = titleDataSource.object(at: indexPath.row)
        cell.textLabel?.text = titltStr as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            // 1.跳转到PNChart图表示例界面
            let pnChartViewController = PNChartViewController.init(nibName: "PNChartViewController", bundle: Bundle.main)
            
            self.navigationController?.pushViewController(pnChartViewController, animated: true)
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

