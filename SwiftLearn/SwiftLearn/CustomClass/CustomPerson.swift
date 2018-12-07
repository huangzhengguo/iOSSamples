//
//  Person.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/12/6.
//  Copyright © 2018年 Inledco. All rights reserved.
//

class CustomPerson {
    let name: String
    init(name: String) {
        self.name = name
        print("\(self.name) is being initialized")
    }
    
    var apartment: Apartment?
    
    deinit {
        print("\(self.name) is being deinitialized")
    }
}
