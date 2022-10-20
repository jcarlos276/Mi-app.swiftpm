import Combine

class HomeViewModel: ObservableObject {
    @Published var selectedCategory: Category = .getDefault()
    @Published var tvShows: [TVShow] = []
    @Published var error: ServiceError?
    
    let categories = Category.getAll()
    var tvShowsService: TvShowsServiceProtocol
    internal var cancellables: Set<AnyCancellable> = .init()
    
    init(tvShowsService: TvShowsServiceProtocol = TvShowsService()) {
        self.tvShowsService = tvShowsService
        setupBindings()
    }
    
    func setupBindings() {
        $selectedCategory
            .sink(receiveValue: { [weak self] category in
                self?.getTvShows(category: category)
            })
            .store(in: &cancellables)
    }
    
    func getTvShows(category: Category) {
        tvShowsService
            .getTvShows(category: category)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                    self.error = error
                    case .finished:
                    self.error = nil
                }
            } receiveValue: { pagination in
                self.tvShows = pagination.results
            }
            .store(in: &cancellables)
        
    }
} 
