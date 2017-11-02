//
//  ViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/10/26.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manualAutoView()
    }

    func manualAutoView() -> Void {
        let frame = CGRect(x: 0, y: 64, width: 150, height: 75)
        let manualAutoViews = ManualAutoSwitchView(frame: frame, manualTitle: "Manual", autoTitle: "Auto")
        
        self.view.addSubview(manualAutoViews)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

