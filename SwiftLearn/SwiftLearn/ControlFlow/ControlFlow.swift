//
//  ControlFlow.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2017/9/29.
//  Copyright © 2017年 Inledco. All rights reserved.
//

class ControFlow {
    func forMethod() {
        // 1.遍历数组
        let names = ["Anna","Alex","Brain","Jack"]
        for name in names {
            print("Hello, \(name)")
        }
        
        // 2.遍历字典，返回的是元组(tuple)，字典无序
        let numberOfLegs = ["spider":8,"ant":6,"cat":4]
        for (animalName,legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        // 2.遍历数字:包含开始和结束
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        // 3.使用下划线代替变量名称
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        
        print("\(base) to power of \(power) is \(answer)")
        
        // 4.半闭合循环
        let minutes = 60
        for tickMark in 0..<minutes {
            print(tickMark)
        }
        
        let minuteInterval = 5
        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
            print(tickMark)
        }
        
        let hours = 12
        let hourInterval = 3
        for tickMark in stride(from: 3, through: hours, by: hourInterval) {
            print(tickMark)
        }
        
        // 5.While循环Snakes and Ladders
        print("Game begin!")
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
        
        var square = 0
        var diceRoll = 1
        while square < finalSquare {
            // roll the dice
            diceRoll += 1
            if diceRoll == 7 {
                diceRoll = 1
            }
            
            // move by the rolled amount
            square += diceRoll
            
            if square < board.count {
                // if we're still on the board, move up or down for a snake or ladder
                square += board[square]
            }
            print("diceRoll=\(diceRoll), square=\(square)")
        }
        
        print("Game over!")
    }
}












































































