//
//  CircleSlider.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/9/5.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class CircleSlider: UIView {
    var trackColor: UIColor = UIColor.green
    var lineWidth: CGFloat = 5.0
    var startRadian: CGFloat = CGFloat(0.0)
    var endRadian: CGFloat = CGFloat(Float.pi * 8.0 / 4.0)
    var thumbRadius: CGFloat = 30.0
    var minValue: Float = 0.0
    var maxValue: Float = 1000.0
    var centerPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    // 圆弧半径
    var radius: CGFloat {
        get {
            if lineWidth > thumbRadius {
                return self.frame.size.width / 2.0 - lineWidth
            } else {
                return self.frame.size.width / 2.0 - thumbRadius
            }
        }
    }
    
    // 当前弧度
    var currentRadian: CGFloat {
        get {
            let percent = (self.currentValue - self.minValue) / (self.maxValue - self.minValue)
            return self.startRadian + (self.endRadian - self.startRadian) * CGFloat(percent)
        }
        
        set {
            
        }
    }
    
    // 当前值
    var currentValue: Float = 500 {
        willSet(newValue) {
            if newValue <= self.minValue {
                self.currentValue = self.minValue
            } else if newValue >= self.maxValue {
                self.currentValue = self.maxValue
            } else {
                self.currentValue = newValue
            }
        }
        
        didSet {
            // 计算当前弧度
            let percent = (self.currentValue - self.minValue) / (self.maxValue - self.minValue)
            self.currentRadian = self.startRadian + (self.endRadian - self.startRadian) * CGFloat(percent)
        }
    }
    
    private var thumbBtn = UIButton.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        centerPoint = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
        
        thumbBtn.frame = CGRect(x: 0, y: 0, width: thumbRadius, height: thumbRadius)
        thumbBtn.layer.cornerRadius = thumbRadius / 2.0
        thumbBtn.backgroundColor = UIColor.red
        
        // 添加拖动手势
        let panGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(thumbPanAction(recognizer:)))
        
        thumbBtn.isUserInteractionEnabled = true
        thumbBtn.addGestureRecognizer(panGestureRecognizer)
        
        self.addSubview(thumbBtn)
        
        thumbBtn.center = CGPoint(x: self.centerPoint.x + self.radius * cos(self.currentRadian), y: self.centerPoint.y + self.radius * sin(self.currentRadian))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func thumbPanAction(recognizer: UIPanGestureRecognizer) -> Void {
        let point = recognizer.translation(in: self)
        print("point = \(point)")
        let btnX = thumbBtn.center.x
        if (thumbBtn.center.x < self.centerPoint.x - radius) {
            thumbBtn.center = CGPoint(x: thumbBtn.center.x, y: sqrt(pow(radius, 2) - pow(thumbBtn.center.x - self.centerPoint.x, 2)) + self.centerPoint.y)
        } else if (thumbBtn.center.x > self.centerPoint.x + radius) {
            thumbBtn.center = CGPoint(x: thumbBtn.center.x, y: sqrt(pow(thumbBtn.center.x - self.centerPoint.x, 2) - pow(radius, 2)) + self.centerPoint.y)
        } else {
            if (thumbBtn.center.y > self.centerPoint.y) {
                thumbBtn.center = CGPoint(x: btnX + point.x, y: sqrt(pow(radius, 2) - pow(thumbBtn.center.x - self.centerPoint.x, 2)) + self.centerPoint.y)
            } else {
                thumbBtn.center = CGPoint(x: btnX + point.x, y: self.centerPoint.y - sqrt(pow(radius, 2) - pow(thumbBtn.center.x - self.centerPoint.x, 2)))
            }
        }
        
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self)
        
        // 计算当前值
        
        self.setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(trackColor.cgColor)
        
        context?.beginPath()
        context?.setLineWidth(lineWidth)
        
        context?.addArc(center: centerPoint, radius: radius, startAngle: startRadian, endAngle: endRadian, clockwise: false)
        
        context?.strokePath()
    }

}
