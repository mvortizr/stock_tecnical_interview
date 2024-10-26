//
//  StockQuote.swift
//  StockTrackerApp
//
//  Created by Maria on 10/26/24.
//

// Define the struct to represent each stock quote.
struct StockQuote: Codable, Identifiable {
    let id: String // This will use the stock symbol as the unique identifier
    let regularMarketPrice: Double
    let regularMarketDayLow: Double
    let regularMarketDayHigh: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "symbol" // Map 'id' to 'symbol'
        case regularMarketPrice
        case regularMarketDayLow
        case regularMarketDayHigh
    }
}

// Define the struct for the overall quote response.
struct QuoteResponse: Codable {
    let quoteResponse: Response

    struct Response: Codable {
        let result: [StockQuote]
    }
}
