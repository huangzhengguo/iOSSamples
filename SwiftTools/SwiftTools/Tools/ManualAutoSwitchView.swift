//
//  ManualAutoSwitchView.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/10/26.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit

class ManualAutoSwitchView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var manualButton: UIButton?
    var autoButton: UIButton?
    var manualSmallFrame: CGRect?
    var manualBigFrame: CGRect?
    var autoSmallFrame: CGRect?
    var autoBigFrame: CGRect?
    typealias manualAutoSwitchType = () -> Void
    var manualModeAction: manualAutoSwitchType?
    var autoModeAction: manualAutoSwitchType?
    
    /// 实现手动和自动模式切换视图
    /// - parameter frame: 视图大小
    /// - parameter manualTitle: 手动模式标题
    /// - parameter autoTitle: 自动模式标题
    ///
    /// - returns:
    init (frame: CGRect!, manualTitle: String!, autoTitle: String!) {
        super.init(frame: frame)
        self.frame = frame
        
        self.backgroundColor = UIColor.green
        let radius = frame.size.height / CGFloat(2)
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        manualSmallFrame = CGRect(x: 5, y: 6, width: frame.size.height - CGFloat(12), height: frame.size.height - CGFloat(12))
        manualBigFrame = CGRect(x: 5, y: 3, width: frame.size.height - CGFloat(6), height: frame.size.height - CGFloat(6))
        autoSmallFrame = CGRect(x: frame.size.width - 5 - frame.size.height + CGFloat(12), y: CGFloat(6), width: frame.size.height - CGFloat(12), height: frame.size.height - CGFloat(12))
        autoBigFrame = CGRect(x: frame.size.width - 5 - frame.size.height + CGFloat(6), y: CGFloat(3), width: frame.size.height - CGFloat(6), height: frame.size.height - CGFloat(6))
        
        manualButton = UIButton(frame: manualBigFrame!)
        manualButton?.tag = 10001
        manualButton?.setTitle(manualTitle, for: .normal)
        manualButton?.titleLabel?.adjustsFontSizeToFitWidth = true
        manualButton?.layer.cornerRadius = (manualButton?.frame.size.height)! / CGFloat(2.0)
        manualButton?.layer.masksToBounds = true
        manualButton?.backgroundColor = UIColor.blue
        manualButton?.addTarget(self, action: #selector(manualAutoAction(sender:)), for: .touchUpInside)
        
        autoButton = UIButton(frame: autoSmallFrame!)
        autoButton?.tag = 10002
        autoButton?.setTitle(autoTitle, for: .normal)
        autoButton?.titleLabel?.adjustsFontSizeToFitWidth = true
        autoButton?.layer.cornerRadius = (manualButton?.frame.size.height)! / CGFloat(2.0)
        autoButton?.layer.masksToBounds = true
        autoButton?.backgroundColor = UIColor.white
        // autoButton?.center = CGPoint(x: (autoButton?.center.x)!, y: frame.size.height / 2.0)
        autoButton?.addTarget(self, action: #selector(manualAutoAction(sender:)), for: .touchUpInside)
        
        self.addSubview(manualButton!)
        self.addSubview(autoButton!)
    }
    
    @objc func manualAutoAction(sender: UIButton) -> Void {
        if sender.tag == 10001 {
            manualButton?.frame = manualBigFrame!
            autoButton?.frame = autoSmallFrame!
            if manualModeAction != nil {
                manualModeAction!()
            }
        } else if sender.tag == 10002 {
            manualButton?.frame = manualSmallFrame!
            autoButton?.frame = autoBigFrame!
            if autoModeAction != nil {
                autoModeAction!()
            }
        } else {
            return
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
