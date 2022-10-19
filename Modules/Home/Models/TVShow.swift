import SwiftUI

struct TVShow: Codable {
    let id: Int
    let name: String
    let backdrop_path: String
    let first_air_date: String
    let genre_ids: [Int]
    let origin_country: [String]
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
    
    static func defaultShow() -> TVShow {
        TVShow(id: 0, name: "Insatiable", backdrop_path: "", first_air_date: "Aug 10, 2018", genre_ids: [], origin_country: [], original_language: "US", original_name: "Insatiable", overview: "A bullied teenager turns to beauty pageants as a way to exact her revenge, with the help of a disgraced coach who so...", popularity: 0, poster_path: "", vote_average: 8.3, vote_count: 939)
    }
}
