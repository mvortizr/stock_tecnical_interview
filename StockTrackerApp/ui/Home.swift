//
//  Home.swift
//  StockTrackerApp
//
//  Created by Maria on 10/26/24.
//

import SwiftUI

struct Home: View {
    @State private var showCustomDialog = false
    
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
                StockList()
            }
            .background(Color.black)
            
            
            if showCustomDialog {
                CustomDialog(
                    title: "New Stock Symbol",
                    buttonTitle: "Ok",
                    action: {
                        print("Button tapped!")
                        showCustomDialog = false // Close dialog on button tap
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

#Preview {
    Home()
}
