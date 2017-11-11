//
//  ViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/10/26.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let toolsTitleArray = ["圆形调光"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tools"
        self.navigationController?.title = "Tools"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func manualAutoView() -> Void {
        let frame = CGRect(x: 0, y: 64, width: 150, height: 75)
        let manualAutoViews = ManualAutoSwitchView(frame: frame, manualTitle: "Manual", autoTitle: "Auto")
        
        self.view.addSubview(manualAutoViews)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toolsTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = toolsTitleArray[indexPath.row]
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let colorCircleViewController = ColorCircleViewController(nibName: "ColorCircleViewController", bundle: nil)
            
            self.navigationController?.pushViewController(colorCircleViewController, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

