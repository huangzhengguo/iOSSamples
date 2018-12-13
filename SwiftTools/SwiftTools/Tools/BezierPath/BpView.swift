//
//  BpView.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/13.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class BpView: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let cr = UIGraphicsGetCurrentContext()
        
        cr?.setFillColor(UIColor.yellow.cgColor)
        cr?.setStrokeColor(UIColor.green.cgColor)
        
        // 1.矩形
        let rectanglePath = UIBezierPath.init(rect: CGRect.init(x: 0.0, y: 0.0, width: 100.0, height: 100.0))

        // 2.圆形及弧形
        let centerPath = UIBezierPath.init(arcCenter: CGPoint(x: 200.0, y: 50.0), radius: 50.0, startAngle: 0, endAngle: CGFloat(Double.pi), clockwise: false)
        
        // 3.直线
        cr?.move(to: CGPoint(x: 300.0, y: 0.0))
        cr?.addLine(to: CGPoint(x: 400.0, y: 100.0))
        
        cr?.addPath(rectanglePath.cgPath)
        cr?.addPath(centerPath.cgPath)

        cr?.drawPath(using: .stroke)
    }
}
