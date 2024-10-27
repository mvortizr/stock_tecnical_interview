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
                            Image("Down_arrow_icon_3x")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                                
                            Text(stock.regularMarketDayLow, format: .number.precision(.fractionLength(2)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 4) {
                        Image("Up_arrow_icon_3x")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            
                        Text(stock.regularMarketDayHigh, format: .number.precision(.fractionLength(2)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 4)

                Divider() // Adds separator only at the bottom
                    .background(Color.white) // Customize the separator color
            }
        .listRowBackground(Color.customGray)

    }
}
