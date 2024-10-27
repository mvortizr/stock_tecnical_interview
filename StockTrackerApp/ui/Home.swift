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
                    Spacer()
                    Text("My Stocks")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                    Button(action: {
                        showCustomDialog.toggle()
                    }) {
                        Circle()
                            .fill(Color.customGray)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle() // Add this for the outline
                                    .stroke(Color.white, lineWidth: 1) // Customize the outline color and width
                            )
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                            .shadow(radius: 5)
                    }
                }.padding()
                StockList(stockQuotes: stockFetcher.stockQuotes)
            }
            .background(Color.customGray)
            
            
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
