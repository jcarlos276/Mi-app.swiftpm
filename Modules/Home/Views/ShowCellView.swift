import SwiftUI

struct ShowCellView: View {
    @State var show: TVShow
    var width: Double
    var backDropPath: String {
        "https://image.tmdb.org/t/p/w500/\(show.backdropPath ?? "")"
    }
    var overview: String {
        show.overview.isEmpty ? "No overview available" : show.overview
    }
    
    init(show: TVShow = TVShow.defaultShow(), width: Double = 120.0) {
        self.show = show
        self.width = width
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            showCellImage()
            VStack(alignment: .leading, spacing: 8) {
                showCellHeader()
                showCellBody()
            }
            .padding(.vertical)
            .padding(.horizontal, 9)
        }
        .background(Color.init(.dark))
        .cornerRadius(10)
    }
    
    @ViewBuilder func showCellImage() -> some View {
        AsyncImage(url: URL(string: backDropPath), content: { phase in
            switch phase {
                case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                default:
                Image("img_logo")
            }
        })
        .frame(width: width, height: 175)
        .clipped()
        .background(Color.black)
    }
    
    @ViewBuilder func showCellHeader() -> some View {
        Group {
            Text(show.name)
                .lineLimit(1)
            HStack {
                Text(show.firstAirDate)
                Spacer()
                Text(String(format: "%.1f", [show.voteAverage]))
            }
            .font(.caption2)
            .lineLimit(1)
        }
        .foregroundColor(Color.init(.algaeGreen))
    }
    
    @ViewBuilder func showCellBody() -> some View {
        Text(overview)
            .foregroundColor(.white)
            .font(.custom("system-default", size: 10))
            .lineLimit(4)
            .frame(height: 56)
    }
}
