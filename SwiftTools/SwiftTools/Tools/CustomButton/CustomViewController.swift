//
//  CustomViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2019/11/6.
//  Copyright © 2019 Huang. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    let customButton: UIButton! = UIButton(frame: CGRect.init(origin: CGPoint(x: 100,y: 100), size: CGSize(width: 100,height: 100)))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.customButton)
        
        self.customButton.backgroundColor = UIColor.blue
        self.customButton.cs_setBackgroundColor(color: UIColor.red, forState: UIControl.State.highlighted)
        // self.customButton.cs_setBackgroundColor(color: UIColor.blue, forState: UIControl.State.normal)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
