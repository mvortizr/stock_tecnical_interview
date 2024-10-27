//
//  ContentView.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var stockFetcher = StockFetcher()
   
    var body: some View {
        VStack{
            Home(stockFetcher: stockFetcher)
        }
    }
}

#Preview {
    ContentView()
}
