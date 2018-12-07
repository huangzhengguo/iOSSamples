//
//  HTMLElement.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/12/7.
//  Copyright © 2018年 Inledco. All rights reserved.
//

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHtml: () -> String = {
        // 解决强引用循环问题：使用weak或者unowned关键字
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)></\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
