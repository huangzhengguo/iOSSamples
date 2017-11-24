//
//  ColorCircleView.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/10.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit
import HGCircularSlider

class ColorCircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    typealias circleSliderPassValueType = (Int, Int) -> Void
    var passColorValueCallback: circleSliderPassValueType?
    var progressViewArray: [CircularSlider]! = [CircularSlider]()
    let percentLabel: UILabel! = UILabel()
    
    init(frame: CGRect, channelNum: Int!, colorArray: [UIColor]!, colorPercentArray: [Int]!, colorTitleArray: [String]!) {
        super.init(frame: frame)
        
        self.frame = frame
        
        // 根据通道数量添加圆形调光
        let centerCircleWidth = CGFloat(60)
        let circleLineWidth = CGFloat(frame.size.width - CGFloat(centerCircleWidth)) / CGFloat(channelNum * 2)
        var progressView: CircularSlider?
        var progressViewCenter:CGPoint? = nil
        for i in 0 ..< channelNum {
            progressView = CircularSlider(frame: CGRect(x: 0.0, y:0.0, width: Double(centerCircleWidth + CGFloat(2 * (channelNum - i)) * circleLineWidth), height: Double(centerCircleWidth + CGFloat(2 * (channelNum - i)) * circleLineWidth)))
            
            progressView?.tag = 1000 + i
            progressView?.minimumValue = 0.0
            progressView?.maximumValue = 1000.0
            progressView?.layer.zPosition = CGFloat(i)
            progressView?.lineWidth = circleLineWidth
            progressView?.backtrackLineWidth = circleLineWidth
            progressView?.backgroundColor = UIColor.clear
            progressView?.thumbRadius = circleLineWidth / 2.0
            progressView?.endThumbTintColor = colorArray[i]
            progressView?.endThumbStrokeColor = UIColor.gray
            progressView?.trackFillColor = colorArray[i]
            progressView?.trackColor = colorArray[i].withAlphaComponent(0.5)
            progressView?.diskColor = UIColor.clear
            progressView?.layer.cornerRadius = (progressView?.frame.size.width)! / 2.0;
            progressView?.clipsToBounds = true
            progressView?.layer.masksToBounds = true
            progressView?.numberOfRounds = 1
            
            if progressViewCenter != nil {
                progressView?.center = progressViewCenter!
            } else {
                progressView?.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: (progressView?.center.y)!)
            }
            
            progressView?.addTarget(self, action: #selector(colorValueChanged(view:)), for: UIControlEvents.valueChanged)
            
            progressViewArray?.append(progressView!)
            self.addSubview(progressView!)
            
            progressViewCenter = progressView?.center
        }
        
        let percentLabelWidth = centerCircleWidth
        percentLabel.layer.zPosition = 1000
        percentLabel.backgroundColor = UIColor.red
        percentLabel.frame = CGRect(x: 0.0, y: 0.0, width: Double(percentLabelWidth), height: Double(percentLabelWidth))
        percentLabel.textColor = UIColor.black
        percentLabel.textAlignment = .center
        percentLabel.layer.cornerRadius = percentLabel.frame.size.width / 2.0
        percentLabel.layer.masksToBounds = true
        percentLabel.center = progressViewCenter!
        
        self.addSubview(percentLabel)
        
        updateManualCircleView(colorPercentArray: colorPercentArray)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        for progressView in self.progressViewArray {
            if touchPointInsideCircle(center: progressView.center, radius: progressView.layer.cornerRadius, point: point) && touchPointOutsideCircle(center: progressView.center, radius: progressView.layer.cornerRadius - progressView.lineWidth, point: point) {
            
                return progressView
            }
        }
        return nil
    }
    
    func touchPointInsideCircle(center: CGPoint, radius: CGFloat, point: CGPoint) -> Bool {
        let x = (point.x - center.x) * (point.x - center.x)
        let y = (point.y - center.y) * (point.y - center.y)
        let dist: CGFloat  = CGFloat(sqrtf(Float(x + y)))
        
        return (dist <= radius)
    }
    
    func touchPointOutsideCircle(center: CGPoint, radius: CGFloat, point: CGPoint) -> Bool {
        let x = (point.x - center.x) * (point.x - center.x)
        let y = (point.y - center.y) * (point.y - center.y)
        let dist: CGFloat  = CGFloat(sqrtf(Float(x + y)))
        
        return (dist > radius)
    }
    
    @objc func colorValueChanged(view: UIView) -> Void {
        let progressView: CircularSlider! = view as! CircularSlider;
        
        print("progressView.endPointValue = \(progressView.endPointValue)")
        percentLabel.text = String(format: "%.0f%%", (progressView.endPointValue) / 10.0)
        if passColorValueCallback != nil {
            passColorValueCallback!(progressView.tag - 1000, Int(progressView.endPointValue))
        }
    }
    
    func updateManualCircleView(colorPercentArray: [Int]!) -> Void {
        for i in 0 ..< colorPercentArray.count {
            progressViewArray![i].endPointValue = CGFloat(colorPercentArray[i] + 500)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
