//
//  StockList.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import SwiftUI

let stocks = [
        Stock(id: "AAPL", symbol: "AAPL", stockPrice: 150.0, maxPriceToday: 155.0, minPriceToday: 145.0),
        Stock(id: "GOOGL", symbol: "GOOGL", stockPrice: 2000.0, maxPriceToday: 2100.0, minPriceToday: 1900.0)
    ]

// List(landmarks, id: \.id) { landmark in
//}

//  List(landmarks) { landmark in
//LandmarkRow(landmark: landmark)
//}

struct StockList: View {
    var body: some View {
        
            List {
                StockRow(stock: stocks[0])
                StockRow(stock: stocks[1])
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            
            .foregroundColor(.white)
            
        
        
    }
}


#Preview {
    StockList()
}
