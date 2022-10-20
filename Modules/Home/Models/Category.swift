import Foundation

struct Category: Hashable {
    var title: String
    var componentName: String
    
    static func getDefault() -> Category {
        Category(title: "Popular", componentName: "popular")
    }
    
    static func getAll() -> [Category] {
        let popular = Self.getDefault()
        let topRated = Category(title: "Top Rated", componentName: "top_rated")
        let onTv = Category(title: "On TV", componentName: "on_the_air")
        let airingToday = Category(title: "Airing Today", componentName: "airing_today")
        return [popular, topRated, onTv, airingToday]
    }
}
