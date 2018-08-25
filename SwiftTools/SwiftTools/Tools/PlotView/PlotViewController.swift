//
//  PlotViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/8/17.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class PlotViewController: UIViewController {
    var plotView: PlotView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        plotView = PlotView(frame: CGRect(x: 0, y: 84, width: self.view.frame.size.width, height: self.view.frame.size.height / 2.0))
        
        plotView?.backgroundColor = UIColor.gray
        plotView?.dataPointArray = [
            [CGPoint(x: 0, y: 0), CGPoint(x: 300, y: 10), CGPoint(x: 600, y: 30), CGPoint(x: 700, y: 20)],
            [CGPoint(x: 0, y: 0), CGPoint(x: 200, y: 10), CGPoint(x: 700, y: 30), CGPoint(x: 800, y: 20)],
            [CGPoint(x: 600, y: 0), CGPoint(x: 900, y: 10), CGPoint(x: 1000, y: 30), CGPoint(x: 1000, y: 60)]
        ]
        
        plotView?.lineColorArray = [UIColor.red, UIColor.green, UIColor.blue]
        plotView?.lineColorTitleArray = ["红", "绿", "蓝"]
        plotView?.markRadius = 6.0
        
        self.view.addSubview(plotView!)
        
        // 绘制坐标轴
        plotView?.drawPlotView()
        
        self.setViews()
    }

    func setViews() {
        let btnTitle = ["隐藏Y轴", "增大标记点", "减小标记点"]
        let btnWidth = (self.view.frame.size.width - 4.0 * 10) / 3.0
        let btnHeight = CGFloat(50.0)
        var btnBottom: CGFloat = 0.0
        for i in 0...btnTitle.count-1 {
            let btn = UIButton(frame: CGRect(x: CGFloat(i) * (btnWidth + 10) + 10, y: (plotView?.frame.origin.y)! + (plotView?.frame.size.height)! + CGFloat(i / 5) * btnHeight + 20, width: btnWidth, height: 50.0))
            
            btn.tag = 10000 + i
            btn.setTitle(btnTitle[i], for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = UIColor.blue
            
            btn.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
            
            btnBottom = btn.frame.origin.y + btn.frame.size.height
            
            self.view.addSubview(btn)
        }
        
        // 添加滑动条
        var colorIndex = 0
        for color in (plotView?.lineColorArray)! {
            let colorSlider = UISlider()
            
            colorSlider.frame = CGRect(x: 30.0, y: btnBottom + CGFloat(colorIndex) * (colorSlider.frame.size.height + 20.0) + 10, width: self.view.frame.size.width - 50.0, height: colorSlider.frame.size.height)
            
            colorSlider.tag = 100000 + colorIndex
            colorSlider.minimumValue = 0
            colorSlider.maximumValue = 100
            colorSlider.backgroundColor = color
            let value = plotView?.dataPointArray[colorIndex][1].y
            colorSlider.value = Float(value == nil ? 0 : value!)
            
            colorSlider.addTarget(self, action: #selector(colorSliderChanged(slider:)), for: .valueChanged)
            
            self.view.addSubview(colorSlider)
            colorIndex = colorIndex + 1
        }
    }
    
    @objc func btnAction(btn: UIButton) {
        let btnIndex = btn.tag - 10000
        switch btnIndex {
        case 0:
            self.plotView?.yAxisEnable = !(self.plotView?.yAxisEnable)!
            btn .setTitle((self.plotView?.yAxisEnable)! ? "隐藏Y轴" : "显示Y轴", for: .normal)
            self.plotView?.refreshPlot()
        case 1:
            self.plotView?.markRadius = (self.plotView?.markRadius)! + 0.5
            self.plotView?.refreshPlot()
        case 2:
            self.plotView?.markRadius = (self.plotView?.markRadius)! > 2 ? (self.plotView?.markRadius)! - 0.5 : (self.plotView?.markRadius)!
            self.plotView?.refreshPlot()
        default:
            break
        }
    }
    
    @objc func colorSliderChanged(slider: UISlider) {
        plotView?.dataPointArray[slider.tag - 100000][1].y = CGFloat(slider.value)
        plotView?.refreshPlot()
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
