//
//  PlotView.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/8/17.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class PlotView: UIView {
    // 顶部边距
    var topPadding: CGFloat = 20.0
    // 左边距
    var leftPadding: CGFloat = 40.0
    // 底部边距
    var bottomMargin: CGFloat = 30.0
    // 右边距
    var rightMargin: CGFloat = 20.0
    // X轴最小值
    var xMinValue: CGFloat = 0.0
    // X轴最大值
    var xMaxValue: CGFloat = 1439.0
    // Y轴最小值
    var yMinValue: CGFloat = 0
    // Y轴最大值
    var yMaxValue: CGFloat = 100.0
    // Y轴间隔
    var yInterval: CGFloat = 25.0
    // X轴间隔
    var xInterval: CGFloat = 120.0
    // 是否显示Y轴
    var yAxisEnable: Bool = false
    // 要绘制的点: 类型为数组中包含数组，每个数组是一条线，数组中的数组长度为2，包含坐标点的X坐标和Y坐标;可以省略前面的类型指定，swift可以自动推断变量类型
    var dataPointArray: [Array<CGFloat>] = [Array<CGFloat>]()
    // 线条颜色：数组的简写语法
    var lineColorArray = [UIColor]()
    // 线条颜色名称
    var lineColorTitleArray = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // 获取当前图像上下文
    }

}




































