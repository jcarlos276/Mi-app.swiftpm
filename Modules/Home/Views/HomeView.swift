import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            categoriesPicker()
            if let error = viewModel.error {
                Text(error.statusMessage)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
            } else {
                showsList()
            }
        }
        .background(Color.init(.almostBlack))
        .onAppear {
            viewModel.getTvShows(category: viewModel.selectedCategory)
        }
    }
    
    @ViewBuilder func categoriesPicker() -> some View {
        Picker(selection: $viewModel.selectedCategory) { 
            ForEach(viewModel.categories, id: \.self) { category in
                Text(category.rawValue)
            }
        } label: { 
            Text("")
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    @ViewBuilder func showsList() -> some View {
        GeometryReader { reader in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 7) {
                    ForEach(viewModel.tvShows, id: \.id) { tvShow in
                        ShowCellView(show: tvShow, width: (reader.size.width / 2.0) - 12.0)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
