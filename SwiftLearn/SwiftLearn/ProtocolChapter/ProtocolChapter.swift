//
//  ProtocolChapter.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/3/22.
//  Copyright © 2018年 Inledco. All rights reserved.
//

public class ProtocolChapter {
    
}

// 协议
protocol FullyNamed {
    var fullName: String { get }
}

// 遵循协议的类
struct Person: FullyNamed {
    var fullName: String
}

public class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

