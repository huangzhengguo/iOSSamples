//
//  main.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2017/9/27.
//  Copyright © 2017年 Inledco. All rights reserved.
//

import Foundation

print("Hello, World!")

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var welcomeMessage: String

welcomeMessage = "hello"

let minValue = UInt8.min
let maxValue = UInt8.max

print("minValue=\(minValue)")
print("maxValue=\(maxValue)")

let oneMillion = 1_000_000
print(oneMillion)

// let cannotBeNegative: UInt8 = -1

// let tooBig: UInt8 = UInt8.max + 1

let twoThousand: uint16 = 2000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

print("twoThousandAndOne=\(twoThousandAndOne)")

typealias AudioSample = UInt16

let htpp404Error = (404,"Not Found")

let possibleNumber = "qw"
let convertNumber: Int? = Int(possibleNumber)

if convertNumber != nil {
    print("convertNumber contains some integer value" +
        "\(convertNumber!)")
}

if let actualNumber = Int(possibleNumber){
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

var serverResponseCode: Int? = 404

serverResponseCode = nil

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

let possibleString: String? = "An optional sting."
let forcedString: String = possibleString!

let assumedString: String! = "An implictly unwrapped" +
                              "optional string."
let imlicitString: String = assumedString
if assumedString != nil{
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}

let greeting = "Hello, world!"
let index = greeting.index(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]

print(beginning)

// 控制流
var controlFlow = ControFlow()

controlFlow.forMethod()

let str = "adslkdjflskjf"

let subStr = (str as NSString).substring(from: str.count - 2)
print(subStr)

let hstring = "1j2k3jj34"
let wan =  hstring
    .map{  Int(String($0)) }
    .filter{ $0 != nil }

print(wan.count)

print(0.3 - 0.2)
print(0.2 - 0.1)
let x = 0.3 - 0.2
let y = 0.2 - 0.1
print("x = \(x)")
print("y = \(y)")
if x == y {
    print("相等")
} else {
    print("不相等")
}

// 进制转换
extension Int {
    var toBinary: String {
        return String(self, radix: 2)
    }
    
    var toHexa: String {
        return String(self, radix: 16)
    }
}

print(20.toBinary)
print(20.toHexa)

extension String {
    var hexaToDecimal: Int {
        return Int(strtol(self, nil, 16))
    }
    
    var hexaToBinary: String {
        return hexaToDecimal.toBinary
    }
    
    var binaryToDecimal: Int {
        return Int(strtol(self, nil, 2))
    }
    
    var binaryToHexa: String {
        return binaryToDecimal.toHexa
    }
}

print("10".binaryToHexa)

// Protocol
protocol SomeProtocol {
    // protocol defination goes here
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

class SomeClass: SomeProtocol {
    var mustBeSettable: Int = 0
    var doesNotNeedToBeSettable: Int = 0
    // class defination goes here
    
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

// An example of a protocol with a single instance requirement
protocol FullyNamed {
    var fullName: String { get }
}

struct Perosn: FullyNamed {
    var fullName: String
}

let john = Perosn(fullName: "John Appleseed") // John.fullname is "John Appleseed"

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.prefix = prefix
        self.name = name
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS") // ncc1701.fullname is "USS Enterprise"
print(ncc1701.fullName)




























