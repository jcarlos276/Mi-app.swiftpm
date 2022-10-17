import Foundation
import Moya

protocol ApiKeyTargetType: TargetType {
    var needsApiKey: Bool { get }
}

struct ApiKeyPlugin: PluginType {
    let apiKey: String?
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard
            let apiKey = apiKey,
            let target = (target as? MultiTarget)?.target as? ApiKeyTargetType ?? target as? ApiKeyTargetType,
            target.needsApiKey
        else {
            return request
        }
        
        var request = request
        request.url?.appendPathComponent("api_key=\(apiKey)")
        return request
    }
}
