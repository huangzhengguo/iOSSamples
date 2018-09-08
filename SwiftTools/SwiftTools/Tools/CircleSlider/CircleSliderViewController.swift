//
//  CircleSliderViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/9/5.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class CircleSliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let circleSlider = CircleSlider(frame: CGRect(x: 50, y: 500, width: self.view.frame.width, height: self.view.frame.width))
        
        self.view.addSubview(circleSlider)
        
        // Do any additional setup after loading the view.
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
