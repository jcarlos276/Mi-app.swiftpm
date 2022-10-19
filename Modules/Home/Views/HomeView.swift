import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Picker(selection: $viewModel.selectedCategory) { 
                    ForEach(viewModel.categories, id: \.self) { category in
                        Text(category.rawValue)
                    }
                } label: { 
                    Text("")
                }
                .pickerStyle(.segmented)
                .padding()
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.tvShows, id: \.id) { tvShow in
                            ShowCellView(show: tvShow, width: (reader.size.width / 2.0) - 10.0)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
            .background(Color.init(.almostBlack))
        }
        .onAppear {
            viewModel.getTvShows(category: viewModel.selectedCategory)
        }
    }
}
