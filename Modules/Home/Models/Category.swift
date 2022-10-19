import Foundation

enum Category: String, CaseIterable {
    case popular = "Popular"
    case topRated = "Top Rated"
    case onTv = "On TV"
    case airingToday = "Airing Today"
    
    func getComponentName() -> String {
        let name = self.rawValue.lowercased().replacingOccurrences(of: " ", with: "_")
        return self == .onTv ? "on_the_air" : name
    }
    
}
