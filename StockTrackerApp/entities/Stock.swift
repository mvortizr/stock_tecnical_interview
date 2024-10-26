//
//  Stock.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import Foundation

struct Stock: Hashable, Codable {
    var id: String
    var symbol: String
    var stockPrice: Float
    var maxPriceToday: Float
    var minPriceToday: Float
    
    init(id: String, symbol: String, stockPrice: Float, maxPriceToday: Float, minPriceToday: Float) {
            self.id = id
            self.symbol = symbol
            self.stockPrice = stockPrice
            self.maxPriceToday = maxPriceToday
            self.minPriceToday = minPriceToday
    }
}
