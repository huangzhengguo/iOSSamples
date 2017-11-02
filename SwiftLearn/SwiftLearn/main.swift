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

let str = "adslkdjflskjf黄"

let subStr = (str as NSString).substring(from: str.count - 2)
print(subStr)

let hstring = "1j2k3jj34"
let wan =  hstring.characters
    .map{  Int(String($0)) }
    .filter{ $0 != nil }

print(wan.count)














