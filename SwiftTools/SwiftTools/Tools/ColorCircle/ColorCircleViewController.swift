//
//  ColorCircleViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/10.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit
import HGCircularSlider

class ColorCircleViewController: UIViewController {

    var manualColorView: ColorCircleView?
    var circleSliderArray: [CircularSlider] = [CircularSlider]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setViews()
    }

    func setViews() -> Void {
        let manualColorViewFrame = CGRect(x: 0, y: 108, width: UIScreen.main.bounds.size.width - 50, height: UIScreen.main.bounds.size.width - 50)
        manualColorView = ColorCircleView(frame: manualColorViewFrame, channelNum: 6, colorArray: [UIColor.red, UIColor.green, UIColor.blue, UIColor.white, UIColor.yellow, UIColor.cyan], colorPercentArray: [50,50,50,50,50,50], colorTitleArray: ["1","2","3","4","5","6"])
        
        self.view.addSubview(manualColorView!)
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
