//
//  main.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2017/9/27.
//  Copyright © 2017年 Inledco. All rights reserved.
//

import Foundation

/*
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

class DataImporter {
    /*
     DataImporter is a class to import data from external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var filename = "data.txt"
    
    // The DataImporter class would provide data importing functionality here.
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    
    // The DataManager would provide data manager functionality here.
    
}

let manager = DataManager()

manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer has not yet been created

print(manager.importer.filename)
// the DataImporter instance for the importer property has not been created
// Prints "data.txt"

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2.0
            let centerY = origin.y + size.height / 2.0
            
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2.0
            origin.y = newCenter.y - size.height / 2.0
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
var initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at(\(square.origin.x), \(square.origin.y))")

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

 
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Add \(totalSteps - oldValue) steps.")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 890

struct SomeStruct {
    static var storedTypeProperty = "some values."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "some values."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "some values."
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStruct.storedTypeProperty)
SomeStruct.storedTypeProperty = "Another value."
print(SomeStruct.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the thresholdLevel
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)

func add() {
    print("add func")
}

add()

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.increment(by: 5)
counter.reset()


struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)

somePoint.moveBy(x: 2.0, y: 2.0)
print("The point is now at(\(somePoint.x),\(somePoint.y))")


enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.high

ovenLight.next()

ovenLight.next()
*/

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level < highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    init(name: String) {
        playerName = name
    }
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
}


var player = Player(name: "Argyrios")

player.complete(level: 1)

print("highest unlock level is now \(LevelTracker.highestUnlockedLevel)")


var player1 = Player(name: "Beto")
if player1.tracker.advance(to: 6) {
    print("player1 is now at level 6")
} else {
    print("level 6 has not yet been unlocked")
}














































































