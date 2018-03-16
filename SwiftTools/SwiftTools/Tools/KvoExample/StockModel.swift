//
//  StockModel.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//
import Foundation

@objcMembers public class StockModel : NSObject {
    dynamic var stockName: String
    dynamic var stockPrice: Float
    
    public init(stockName: String, stockPrice: Float) {
        self.stockName = stockName
        self.stockPrice = stockPrice
    }
}
