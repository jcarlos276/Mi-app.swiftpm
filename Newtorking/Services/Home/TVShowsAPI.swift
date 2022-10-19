import Foundation
import Moya

enum TvShowsAPI {
    case getTvShows(category: Category)
}

extension TvShowsAPI: ApiKeyTargetType {
    var needsApiKey: Bool {
        true
    }
    
    var path: String {
        switch self {
        case .getTvShows(let category):
            return "tv/\(category.getComponentName())"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTvShows(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getTvShows(_):
            return .requestPlain
        }
    }
}
