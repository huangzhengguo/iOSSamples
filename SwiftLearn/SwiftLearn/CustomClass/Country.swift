//
//  Country.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/12/7.
//  Copyright © 2018年 Inledco. All rights reserved.
//

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        // 到这里的时候，说明初始化已经全部完成
        self.capitalCity = City(name: capitalName, country: self)
    }
}
