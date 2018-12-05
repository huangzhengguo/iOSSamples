//
//  CustomView.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/3.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class CustomView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
