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
        VStack {
            HStack {
                    Text(stock.id)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(stock.regularMarketPrice, format: .number.precision(.fractionLength(2)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 4) {
                            Image(systemName: "arrow.down.right.circle.fill") // Example image
                                .foregroundColor(.red)
                            Text(stock.regularMarketDayLow, format: .number.precision(.fractionLength(2)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.left.circle.fill")
                            .foregroundColor(.blue)
                        Text(stock.regularMarketDayHigh, format: .number.precision(.fractionLength(2)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 4) // Optional: to control row height

                Divider() // Adds separator only at the bottom
                    .background(Color.white) // Customize the separator color
            }
            .listRowBackground(Color.black)

    }
}
