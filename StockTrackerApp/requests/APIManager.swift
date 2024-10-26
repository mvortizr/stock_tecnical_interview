//
//  APIManager.swift
//  StockTrackerApp
//
//  Created by Maria on 10/26/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func fetchCrumb() async throws -> String {
                
        guard let url = URL(string: "https://query2.finance.yahoo.com/v1/test/getcrumb") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        
        // set user agent
        let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:124.0) Gecko/20100101 Firefox/124.0"
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        
        // set cookie header
        let cookieValue = "A1=d=AQABBCRmGWYCEGs-o7addzEYXnaZV22B_XEFEgEBAQG3GmYjZnwYzSMA_eMAAA&S=AQAAArS5ucCh-OnJPVGIovBSteM; A3=d=AQABBCRmGWYCEGs-o7addzEYXnaZV22B_XEFEgEBAQG3GmYjZnwYzSMA_eMAAA&S=AQAAArS5ucCh-OnJPVGIovBSteM; A1S=d=AQABBCRmGWYCEGs-o7addzEYXnaZV22B_XEFEgEBAQG3GmYjZnwYzSMA_eMAAA&S=AQAAArS5ucCh-OnJPVGIovBSteM; _ga_BFY40XXE01=GS1.1.1712941429.1.0.1712941429.0.0.0; cmp=t=1712941428&j=0&u=1---; gpp=DBAA; gpp_sid=-1; axids=gam=y-VQIaTG5E2uINJxNxhsK5NloTJIAvLG2Z~A&dv360=eS1ZX3lrVWt4RTJ1R0o3ZTV3QmI0WUlMcXRBcVJQeWFkNH5B&ydsp=y-eN_xg5dE2uI95s.0_03jHmucCaFUbIp6~A&tbla=y-treoy_NE2uL2hIFAW7cjFNfY0vQRJnQG~A; tbla_id=188af4a4-4809-4101-8afb-84e6a566cbcd-tuctd12eef5"
        request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let crumb = String(data: data, encoding: .utf8) else {
            throw URLError(.cannotParseResponse)
        }
                
        return crumb
    }
    
    func fetchStockQuote(withCrumb crumb: String, symbols: [String]) async throws -> [StockQuote] {
        
        let symbolsString = symbols.joined(separator: ",")
        
        guard let url = URL(string: "https://query1.finance.yahoo.com/v7/finance/quote?symbols=\(symbolsString)&crumb=\(crumb)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        
        // set user agent
        let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:124.0) Gecko/20100101 Firefox/124.0"
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        
        // set cookie header (if needed, otherwise you can remove this)
        let cookieValue = "A1=d=AQABBCRmGWYCEGs-o7addzEYXnaZV22B_XEFEgEBAQG3GmYjZnwYzSMA_eMAAA&S=AQAAArS5ucCh-OnJPVGIovBSteM; A3=d=AQABBCRmGWYCEGs-o7addzEYXnaZV22B_XEFEgEBAQG3GmYjZnwYzSMA_eMAAA&S=AQAAArS5ucCh-OnJPVGIovBSteM; A1S=d=AQABBCRmGWYCEGs-o7addzEYXnaZV22B_XEFEgEBAQG3GmYjZnwYzSMA_eMAAA&S=AQAAArS5ucCh-OnJPVGIovBSteM; _ga_BFY40XXE01=GS1.1.1712941429.1.0.1712941429.0.0.0; cmp=t=1712941428&j=0&u=1---; gpp=DBAA; gpp_sid=-1; axids=gam=y-VQIaTG5E2uINJxNxhsK5NloTJIAvLG2Z~A&dv360=eS1ZX3lrVWt4RTJ1R0o3ZTV3QmI0WUlMcXRBcVJQeWFkNH5B&ydsp=y-eN_xg5dE2uI95s.0_03jHmucCaFUbIp6~A&tbla=y-treoy_NE2uL2hIFAW7cjFNfY0vQRJnQG~A; tbla_id=188af4a4-4809-4101-8afb-84e6a566cbcd-tuctd12eef5"
        request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        // Decode the JSON data into the QuoteResponse struct
       let decoder = JSONDecoder()
       let quoteResponse = try decoder.decode(QuoteResponse.self, from: data)
       
       // Return the array of StockQuote
       return quoteResponse.quoteResponse.result
        
    }
}
    
    
    
    
