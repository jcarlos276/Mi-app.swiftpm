import SwiftUI

struct TVShow: Codable {
    let id: Int
    let name: String
    let backdropPath: String?
    let firstAirDate: String
    let genreIds: [Int]
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Int
    
    static func defaultShow() -> TVShow {
        TVShow(id: 0, name: "Insatiable", backdropPath: "", firstAirDate: "Aug 10, 2018", genreIds: [], originCountry: [], originalLanguage: "US", originalName: "Insatiable", overview: "A bullied teenager turns to beauty pageants as a way to exact her revenge, with the help of a disgraced coach who so...", popularity: 0, posterPath: "", voteAverage: 8.3, voteCount: 939)
    }
}
