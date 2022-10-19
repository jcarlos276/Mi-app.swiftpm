import Combine

class HomeViewModel: ObservableObject {
    @Published var selectedCategory: Category = .popular
    @Published var tvShows: [TVShow] = []
    
    let categories = Category.allCases
    var tvShowsService: TvShowsServiceProtocol
    internal var cancellables: Set<AnyCancellable> = .init()
    
    init(tvShowsService: TvShowsServiceProtocol = TvShowsService()) {
        self.tvShowsService = tvShowsService
        print("init HomeviewModel")
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
                    print("ERROR HERE")
                    print(error.localizedDescription)
                    case .finished:
                    return
                }
            } receiveValue: { pagination in
                self.tvShows = pagination.results
            }
            .store(in: &cancellables)
        
    }
} 
