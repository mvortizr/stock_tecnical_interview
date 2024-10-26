//
//  ContentView.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var crumFetcher = CrumFetcher()
   
    var body: some View {
        VStack{
            if let crumb = crumFetcher.crumb {
                           Text("Crumb: \(crumb)")
                       } else {
                           Text("Loading...")
                       }
            Home()
        }
        
    }
}

#Preview {
    ContentView()
}
