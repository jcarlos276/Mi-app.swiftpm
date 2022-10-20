import Foundation
import Moya
import Combine
import CombineMoya

protocol NetworkServiceProtocol {
    func execute(request: TargetType, decoder: JSONDecoder) -> AnyPublisher<Data, ServiceError>
}

extension NetworkServiceProtocol {
    func execute<T: Decodable>(request: TargetType, decoder: JSONDecoder = .snakeCase) -> AnyPublisher<T, ServiceError> {
        execute(request: request, decoder: decoder)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                error as? ServiceError ?? ServiceError()
            }
            .eraseToAnyPublisher()
    }
}

struct NetworkService: NetworkServiceProtocol {
    let provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    
    func execute(request: TargetType, decoder: JSONDecoder) -> AnyPublisher<Data, ServiceError> {
        Future<Data, ServiceError> { promise in
            provider.request(MultiTarget(request)) { result in
                print(result)
                switch result {
                case .success(let response):
                    print("SUCCESS")
                    promise(.success(response.data))
                case .failure(let moyaError):
                    print("FAILURE")
                    do {
                        if let data = moyaError.response?.data {
                            let customError = try JSONDecoder().decode(ServiceError.self, from: data)
                            promise(.failure(customError))
                        } else {
                            promise(.failure(ServiceError()))
                        }
                    } catch {
                        promise(.failure(ServiceError(statusCode: -999, statusMessage: "Couldn't parse error")))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
