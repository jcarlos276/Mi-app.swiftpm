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
            
        }
    }
}
