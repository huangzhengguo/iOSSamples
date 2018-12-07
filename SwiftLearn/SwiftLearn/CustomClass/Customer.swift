//
//  Customer.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/12/7.
//  Copyright © 2018年 Inledco. All rights reserved.
//

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
