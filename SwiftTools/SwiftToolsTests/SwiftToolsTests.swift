//
//  SwiftToolsTests.swift
//  SwiftToolsTests
//
//  Created by huang zhengguo on 2017/10/26.
//  Copyright © 2017年 Huang. All rights reserved.
//

import XCTest
@testable import SwiftTools

class SwiftToolsTests: XCTestCase {
    
    var colorCircleView:ColorCircleView?  = ColorCircleView(frame: CGRect(x: 0.0,y: 0.0,width: 0.0,height: 0.0), channelNum: 1, colorArray: [UIColor.red], colorPercentArray: [50], colorTitleArray: ["Red"])
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        colorCircleView = nil
        
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let center = CGPoint(x: 0, y: 0)
        let radius = 5.0
        let point = CGPoint(x: 2, y: 0)
        let isInside = colorCircleView?.touchPointInsideCircle(center: point, radius: CGFloat(radius), point: center)
        XCTAssert(isInside!, "测试失败！")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
