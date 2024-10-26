import Foundation
import SwiftUI


@MainActor
class CrumFetcher: ObservableObject {
    @Published var crumb: String?
    
    init() {
        Task {
            await fetchCrumbOnLoad()
        }
    }
    
    func fetchCrumbOnLoad() async {
        do {
            crumb = try await APIManager.shared.fetchCrumb()
        } catch {
            print("Failed to fetch crumb: \(error)")
        }
    }
}
