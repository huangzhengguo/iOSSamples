//
//  Apartment.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/12/7.
//  Copyright © 2018年 Inledco. All rights reserved.
//

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) is being initialized")
    }
    
    weak var tenant: CustomPerson?
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
