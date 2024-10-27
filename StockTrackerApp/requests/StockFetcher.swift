import Foundation
import SwiftUI

@MainActor
class StockFetcher: ObservableObject {
    @Published var crumb: String?
    @Published var stockQuotes: [StockQuote] = []
    let symbolsName = "userSavedSymbols"
    
    init() {
        Task {
            
            await fetchStocks()
        }
    }
    
    // check if symbol is valid,
        //if it is symbol is added to default and stocklist is refetched
    public func addSymbol(_ symbol: String) async {
        if let isValid = await self.fetchStockQuote(for: symbol), isValid {
                addSymbolToDefaults(symbol)
                await fetchStocks()
                print("Symbol \(symbol) added successfully")
        } else {
                print("Symbol \(symbol) is invalid or not found")
        }
    }
    
    // add an individual symbol to defaults
    private func addSymbolToDefaults(_ symbol: String) {
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
    
    //fetch all the stocks saved in userDefaults
    func fetchStocks() async {
        do {
            let crumb = try await APIManager.shared.fetchCrumb()
            self.crumb = crumb
            stockQuotes = try await APIManager.shared.fetchStockQuote(withCrumb: crumb,symbols: fetchSymbols())
            print("Stock Quote: \(stockQuotes)")
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    // Fetch a single stock quote to validate its existence
    private func fetchStockQuote(for symbol: String) async -> Bool? {
        do {
            
            let stockQuote = try await APIManager.shared.fetchStockQuote(withCrumb: self.crumb!,symbols: [symbol])
            return stockQuote.count>0
        } catch {
            print("Error fetching data: \(error)")
        }
        return nil
    }
}

