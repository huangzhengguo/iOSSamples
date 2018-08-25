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
    var bottomPadding: CGFloat = 30.0
    // 右边距
    var rightPadding: CGFloat = 20.0
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
    // 点的半径
    var markRadius: CGFloat = 2.0
    // 是否显示Y轴
    var yAxisEnable: Bool = true
    // 是否显示Y轴标题
    var yAxisLabelEnable: Bool = true
    // 要绘制的点: 类型为数组中包含数组，每个数组是一条线，数组中的元素为点，包含坐标点的X坐标和Y坐标;可以省略前面的类型指定，swift可以自动推断变量类型
    var dataPointArray: [Array<CGPoint>] = [Array<CGPoint>]()
    // 线条颜色：数组的简写语法
    var lineColorArray = [UIColor]()
    // 线条颜色名称
    var lineColorTitleArray = [String]()
    // 去掉边距后的宽度
    var plotWidth: CGFloat?
    // 去掉边距后的高度
    var plotHeight: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.plotWidth = self.frame.size.width - self.leftPadding - self.rightPadding
        self.plotHeight = self.frame.size.height - self.topPadding - self.bottomPadding
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawPlotView() {
        // 添加Y轴标题
        if yAxisLabelEnable == true {
            let yUint = self.plotHeight! / self.yMaxValue;
            for i in 0...(Int)(self.yMaxValue / self.yInterval + 1) {
                let label = UILabel(frame: CGRect(x: 0, y: yUint * CGFloat(i) * self.yInterval + self.topPadding - 10, width: self.leftPadding, height: 20))
                
                label.font = UIFont.systemFont(ofSize: 10)
                label.text = String.init(stringLiteral: "\(100 - i * 25)%")

                label.textColor = UIColor.white
                label.textAlignment = .center
                self.addSubview(label)
            }
        }
        
        // 添加X轴
        self.addXLabel()
    }
    
    func addXLabel() {
        let xUint = self.plotWidth! / self.xMaxValue;
        for i: CGFloat in stride(from: 0, to: self.xMaxValue, by: self.xInterval) {
            // 添加坐标
            let label = UILabel(frame: CGRect(x: self.leftPadding + i * xUint - 10, y: self.frame.size.height - 30, width: self.frame.size.width / 5, height: 20))
            
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.text = String.init(stringLiteral: "\(Int(i))")
            label.textColor = UIColor.white
            
            self.addSubview(label)
        }
    }
    
    func refreshPlot() -> Void {
        self.setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // 获取当前图像上下文
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setFillColor(UIColor.red.cgColor)
        
        // X轴单位长度
        let xUnit = self.plotWidth! / self.xMaxValue
        
        // Y轴单位长度
        let yUnit = self.plotHeight! / self.yMaxValue
        
        // 绘制Y轴
        if self.yAxisEnable == true {
            context?.beginPath()
            context?.move(to: CGPoint(x: self.leftPadding, y: self.topPadding))
            context?.addLine(to: CGPoint(x: self.leftPadding, y: self.topPadding + self.plotHeight!))
            context?.strokePath()
        }
        
        // 绘制X轴刻度
        for i in 0...((Int)((self.xMaxValue + 1) / self.xInterval) + 1) {
            context?.move(to: CGPoint(x: self.leftPadding + CGFloat(i) * xUnit * self.xInterval, y: self.plotHeight!  + self.topPadding - 10))
            context?.addLine(to: CGPoint(x: self.leftPadding + CGFloat(i) * xUnit * self.xInterval, y: self.plotHeight!  + self.topPadding))
            context?.strokePath()
        }
        
        // 绘制X轴
        context?.beginPath()
        context?.move(to: CGPoint(x: self.leftPadding, y: self.topPadding + self.plotHeight!))
        context?.addLine(to: CGPoint(x: self.leftPadding + self.plotWidth!, y: self.topPadding + self.plotHeight!))
        context?.strokePath()
        
        
        // 根据给定的数据点绘制曲线
        context?.beginPath()
        for lineIndex in 0...self.dataPointArray.count-1 {
            if lineIndex < self.lineColorArray.count {
                context?.setStrokeColor(self.lineColorArray[lineIndex].cgColor)
                context?.setFillColor(self.lineColorArray[lineIndex].cgColor)
            } else {
                context?.setStrokeColor(UIColor.white.cgColor)
                context?.setFillColor(UIColor.white.cgColor)
            }
            
            for pointIndex in 0...self.dataPointArray[lineIndex].count-2 {
                // 转换坐标为当前视图的点
                let currentPoint = CGPoint(x: self.leftPadding + self.dataPointArray[lineIndex][pointIndex].x * xUnit, y: self.plotHeight! - self.dataPointArray[lineIndex][pointIndex].y * yUnit + self.topPadding)
                let nextPoint = CGPoint(x: self.leftPadding + self.dataPointArray[lineIndex][pointIndex + 1].x * xUnit, y: self.plotHeight! - self.dataPointArray[lineIndex][pointIndex + 1].y * yUnit + self.topPadding)

                context?.move(to: currentPoint)
                
                // 画线
                context?.addLine(to: nextPoint)
                context?.strokePath()

                // 标记点
                context?.addArc(center: currentPoint, radius: markRadius, startAngle: 0.0, endAngle: CGFloat.pi * 2, clockwise: false)
                context?.fillPath()
                // 如果是最后一段线条，则标记最后一个点
                if pointIndex == self.dataPointArray[lineIndex].count-2 {
                    context?.addArc(center: nextPoint, radius: markRadius, startAngle: 0.0, endAngle: CGFloat.pi * 2, clockwise: false)
                    context?.fillPath()
                }
            }
        }
    }
}




































