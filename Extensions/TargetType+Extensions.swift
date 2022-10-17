import Foundation
import Moya

extension TargetType {
    var baseURL: URL {
        URL(string: AppConstants.baseUrl)!
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json",
         "Accept": "application/json"]
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    var sampleData: Data {
        Data()
    }
}
