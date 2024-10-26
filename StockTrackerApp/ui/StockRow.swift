//
//  StockRow.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import SwiftUI

struct StockRow: View {
    var stock: StockQuote


    var body: some View {
        HStack{
            Text (stock.id)
            Text(stock.regularMarketPrice, format: .number)
            Text(stock.regularMarketDayLow, format: .number)
            Text(stock.regularMarketDayHigh, format: .number)
            
        }.listRowBackground(Color.black)
    }
}


//#Preview {
//    
//    StockRow(stock: StockQuote(symbol: "AAPL", regularMarketPrice: 150.0, regularMarketDayLow: 155.0, regularMarketDayHigh: 145.0))
//}
