//
//  StockList.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import SwiftUI



struct StockList: View {
    let stockQuotes: [StockQuote]
    var body: some View {
        
            List(stockQuotes) { quote in
                StockRow(stock: quote)
                    .listRowInsets(EdgeInsets())
            }
            .scrollContentBackground(.hidden)
            .background(Color.customGray)
            .foregroundColor(.white)
            
    }
}

