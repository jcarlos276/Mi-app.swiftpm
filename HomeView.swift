import SwiftUI
import Combine

struct HomeView: View {
    var body: some View {
        VStack {
            Picker(selection: .constant("")) { 
                Text("Popular")
                Text("Top Rated")
                Text("On TV")
                Text("Airing Today")
            } label: { 
                Text("")
            }
            .pickerStyle(.segmented)
            .padding()
            ScrollView {
                LazyVGrid(columns: [.init(), .init()], alignment: .center) {
                    ShowCellView()
                    ShowCellView()
                    ShowCellView()
                    ShowCellView()
                    ShowCellView()
                    ShowCellView()
                }
                .padding(.horizontal, 10)
            }
        }
        .background(Color.init(.almostBlack))
    }
}
