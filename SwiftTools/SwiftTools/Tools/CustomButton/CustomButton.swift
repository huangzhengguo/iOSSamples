//
//  CustomButton.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2019/11/6.
//  Copyright © 2019 Huang. All rights reserved.
//

import UIKit

public extension UIButton {
    private struct cs_backgroundColor {
        static var keyBackgroundColors = "cs_keyBackgroundColors"
        static var keyBackgroundColor_Normal = "cs_keyBackgroundColor_Normal"
        static var keyBackgroundColor_Highlighted = "cs_keyBackgroundColor_Highlighted"
    }
    
    var cs_dictBackgroundColors : Dictionary<String, UIColor>! {
        get {
                if let dictBackgroundColors = objc_getAssociatedObject(self, &cs_backgroundColor.keyBackgroundColors) {
                    return dictBackgroundColors as? Dictionary<String, UIColor>
            }
            
            return nil
        }
        
        set {
            objc_setAssociatedObject(self, &cs_backgroundColor.keyBackgroundColors, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func cs_setBackgroundColor(color: UIColor, forState: UIControl.State) {
        if self.cs_dictBackgroundColors == nil {
            self.cs_dictBackgroundColors = Dictionary<String, UIColor>()
        }
        
        if let key = self.cs_stringForUIControlState(state: state) {
            self.cs_dictBackgroundColors[key] = color
        }
    }
    
    private func cs_stringForUIControlState(state: UIControl.State) -> String! {
        var cs_string = ""
        
        switch state {
        case .normal:
            cs_string = cs_backgroundColor.keyBackgroundColor_Normal
        case .highlighted:
            cs_string = cs_backgroundColor.keyBackgroundColor_Highlighted
        default:
            cs_string = cs_backgroundColor.keyBackgroundColor_Normal
        }
        
        return cs_string
    }
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        
        set {
            if newValue {
                if let key = self.cs_stringForUIControlState(state: .highlighted) {
                    // self.backgroundColor = self.cs_dictBackgroundColors[key]
                }
            } else {
                if let key = self.cs_stringForUIControlState(state: .normal) {
                    // self.backgroundColor = self.cs_dictBackgroundColors[key]
                }
            }
        }
    }
}
