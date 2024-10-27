//
//  Home.swift
//  StockTrackerApp
//
//  Created by Maria on 10/26/24.
//

import SwiftUI

struct Home: View {
    @State private var showCustomDialog = false
    @ObservedObject var stockFetcher: StockFetcher
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Text("My Stocks")
                        .foregroundColor(.white)
                    Button(action: {
                        showCustomDialog.toggle()
                    }) {
                        Circle()
                            .fill(.blue)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                            .shadow(radius: 5)
                    }
                }
                StockList(stockQuotes: stockFetcher.stockQuotes)
            }
            .background(Color.black)
            
            
            if showCustomDialog {
                CustomDialog(
                    title: "New Stock Symbol",
                    buttonTitle: "Ok",
                    action: { newSymbol in
                        Task {
                            await stockFetcher.addSymbol(newSymbol)
                            // check if symbol is valid and refecht stocks
                        }
                        showCustomDialog = false
                    },
                    textfieldLabel: "Enter new Stock Symbol",
                    closeAction: {
                        showCustomDialog = false // Close dialog on "x" button tap
                    }
                )
            }
        }
    }
}

//#Preview {
//    Home()
//}
