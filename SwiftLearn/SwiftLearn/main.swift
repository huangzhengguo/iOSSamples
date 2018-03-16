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


// 类方法使用关键字static和class标识，class标识的类方法子类可以继承重写
struct LevelTracker {
    // 类属性
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



func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporary = a
    a = b
    b = temporary
}

var someInt = 10
var anotherInt = 20

swapTwoInts(&someInt, &anotherInt)

print("someInt is now \(someInt), anotherInt is now \(anotherInt)")

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}

swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), anotherInt is now \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString is now \(someString), anotherString is now \(anotherString)")

swap(&someString, &anotherString)
print("someString is now \(someString), anotherString is now \(anotherString)")
 

struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        // 移除最后一个元素，并且返回移除的元素
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()

stackOfString.push("Hello")
stackOfString.push("world")
stackOfString.push("!")

print("stack top is \(stackOfString.pop())")

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfString.topItem {
    print("The top item on the stack is \(topItem).")
}
 


func findIndex(ofString valueToFind: String, in array: [String]) ->Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findIndex(ofString: "parakeet", in: strings) {
    print("The index of parakeet is \(foundIndex)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}


protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item{ get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}


protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get set }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullNamed {
    var fullName: String { get }
}

struct Person: FullNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

class Starship: FullNamed {
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

// 随机数协议
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()

print("Here is a random number: \(generator.random())")
print("And another one: \(generator.random())")

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off

lightSwitch.toggle()


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        
        return lastRandom / m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

//for _ in 1...5 {
//    print("Random dice roll is \(d6.roll())")
//}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice: Dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    
    var square = 0
    var board: [Int]
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

*/

//protocol Named {
//    var name: String { get }
//}
//
//protocol Aged {
//    var age: Int { get }
//}
//
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//
//func wishHappyBirthday(to celebrator: Named & Aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
//}
//
//let birthdayPerson = Person(name: "xiaoxin", age: 5)
//wishHappyBirthday(to: birthdayPerson)
//
//class Location {
//    var latitude: Double
//    var longitude: Double
//
//    init(latitude: Double, longitude: Double) {
//        self.latitude = latitude
//        self.longitude = longitude
//    }
//}
//
//class City: Location, Named {
//    var name: String
//
//    init(name: String, latitude: Double, longitude: Double) {
//        self.name = name
//        super.init(latitude: latitude, longitude: longitude)
//    }
//}
//
//func beginConcert(in location: Location & Named) {
//    print("Hello \(location.name)!")
//}
//
//let city = City(name: "zhengzhou", latitude: 113.42, longitude: 34.44)
//
//beginConcert(in: city)
//
//protocol HasArea {
//    var area: Double { get }
//}
//
//class Circle: HasArea {
//    let pi = 3.1415927
//    var radius: Double
//
//    var area: Double { return pi * radius * radius }
//
//    init(radius: Double) {
//        self.radius = radius
//    }
//}
//
//class Country: HasArea {
//    var area: Double
//
//    init(area: Double) {
//        self.area = area
//    }
//}
//
//class Animal {
//    var legs: Int
//
//    init(legs: Int) {
//        self.legs = legs
//    }
//}
//
//let objects: [AnyObject] = [Circle(radius: 2.0), Country(area: 243_610), Animal(legs: 4)]
//
//for object in objects {
//    if let objectWithArea = object as? HasArea {
//        print("Area is \(objectWithArea.area)")
//    } else {
//        print("Something that doesn't have an eare.")
//    }
//}
//
//@objc protocol CounterDataSource {
//    @objc optional func increment(forCount count: Int) -> Int
//    @objc optional var fixedIncrement: Int { get }
//}
//
//class Counter {
//    var count = 0
//    var datasource: CounterDataSource?
//
//    func increment() {
//        if let amount = datasource?.increment?(forCount: count) {
//            count += amount
//        } else if let amount = datasource?.fixedIncrement {
//            count += amount
//        }
//    }
//}
//
//class ThreeSource: NSObject, CounterDataSource {
//    let fixedIncrement = 3
//}
//
//var counter = Counter()
//
//counter.datasource = ThreeSource()
//
//for _ in 1...4 {
//    counter.increment()
//    print(counter.count)
//}
//
//class TowardsZeroSource: NSObject, CounterDataSource {
//    func increment(forCount count: Int) -> Int {
//        if count == 0 {
//            return 0
//        } else if (count < 0) {
//            return 1
//        } else {
//            return -1
//        }
//    }
//}
//
//counter.count = 90
//counter.datasource = TowardsZeroSource()
//for _ in 0...100 {
//    counter.increment()
//    print("counter.count = \(counter.count)")
//}
//
//extension Collection where Iterator.Element: HasArea {
//
//}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

var matrix = Matrix(rows: 2, columns: 3)

matrix[0,1] = 9.0
matrix[1,2] = 8.9

for item in matrix.grid {
    print(" \(item)")
}

let errorValue = matrix[9,9]

let someVehicle = Vehicle()












