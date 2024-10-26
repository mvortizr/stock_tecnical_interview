import Foundation
import SwiftUI

@MainActor
class StockFetcher: ObservableObject {
    @Published var crumb: String?
    @Published var stockQuotes: [StockQuote] = []
    let symbolsName = "userSymbols"
    
    init() {
        Task {
            
            await fetchStocks()
        }
    }
    
    public func addSymbolToDefaults(_ symbol: String) {
            var symbols = UserDefaults.standard.stringArray(forKey: symbolsName) ?? []
            if !symbols.contains(symbol) {
                symbols.append(symbol)
                UserDefaults.standard.set(symbols, forKey: symbolsName)
            }
    }
    
    //get symbols from user defaults
    private func fetchSymbols() -> [String] {
            UserDefaults.standard.array(forKey: symbolsName) as? [String] ?? []
    }
    
        
    func fetchStocks() async {
        do {
            let crumb = try await APIManager.shared.fetchCrumb()
            self.crumb = crumb // Save the crumb value
            //let symbols = ["AAPL", "GOOGL"]
            stockQuotes = try await APIManager.shared.fetchStockQuote(withCrumb: crumb,symbols: fetchSymbols())
            print("Stock Quote: \(stockQuotes)")
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

