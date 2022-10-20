import Foundation
import Combine
import Moya

protocol TvShowsServiceProtocol {
    func getTvShows(category: Category) -> AnyPublisher<Pagination, ServiceError>
}

struct TvShowsService: TvShowsServiceProtocol {
    private let provider: NetworkServiceProtocol
    
    init(provider: NetworkServiceProtocol = 
         NetworkService(provider: 
                            MoyaProvider<MultiTarget>(plugins: 
                                                        [ApiKeyPlugin(apiKey: AppConstants.apiKey)]
                                                     )
         )
    ) {
        self.provider = provider
    }
    
    func getTvShows(category: Category) -> AnyPublisher<Pagination, ServiceError> {
        provider
            .execute(request: TvShowsAPI.getTvShows(category: category))
            .eraseToAnyPublisher()
    }
}
