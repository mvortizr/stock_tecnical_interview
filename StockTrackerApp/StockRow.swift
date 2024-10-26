//
//  StockRow.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import SwiftUI

//let stocks = [
//        Stock(id: "AAPL", symbol: "AAPL", stockPrice: 150.0, maxPriceToday: 155.0, minPriceToday: 145.0),
//        Stock(id: "GOOGL", symbol: "GOOGL", stockPrice: 2000.0, maxPriceToday: 2100.0, minPriceToday: 1900.0)
//    ]

struct StockRow: View {
    var stock: Stock


    var body: some View {
        HStack{
            Text (stock.symbol)
            Text(stock.stockPrice, format: .number)
            Text(stock.minPriceToday, format: .number)
            Text(stock.maxPriceToday, format: .number)
            
        }.listRowBackground(Color.black)
    }
}


#Preview {
    
    StockRow(stock: Stock(id: "AAPL", symbol: "AAPL", stockPrice: 150.0, maxPriceToday: 155.0, minPriceToday: 145.0))
}
