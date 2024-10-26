//
//  ContentView.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showCustomDialog = false
    var body: some View {
        ZStack{
            if showCustomDialog {
                CustomDialog(title: "New Stock Symbol", buttonTitle: "Ok", action: {
                    print("Button tapped!")
                }, textfieldLabel: "Enter new Stock Symbol")
            }
            VStack {
                Spacer()
                HStack {
                    Text("My Stocks").foregroundColor(.white)
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
        }
            
        
    }
}

#Preview {
    ContentView()
}
