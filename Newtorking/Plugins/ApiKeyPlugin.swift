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
        var components = URLComponents(string: request.url?.absoluteString ?? "")
        components?.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        request.url = components?.url!
        print("URL > \(request.url?.absoluteString ?? "")")
        return request
    }
}
