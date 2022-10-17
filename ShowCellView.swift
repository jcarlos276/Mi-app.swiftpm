import SwiftUI

struct ShowCellView: View {
    @State var imageUrl: String
    @State var name: String
    @State var airDate: String
    @State var rating: Double
    @State var overview: String
    
    init(imageUrl: String = "",
         name: String = "Insatiable",
         airDate: String = "Aug 10, 2018",
         rating: Double = 0,
         overview: String = "A bullied teenager turns to beauty pageants as a way to exact her revenge, with the help of a disgraced coach who so...") {
        self.imageUrl = imageUrl
        self.name = name
        self.airDate = airDate
        self.rating = rating
        self.overview = overview
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
        Image("img_logo")
            .resizable()
            .scaledToFill()
            .scaledToFit()
            .frame(height: 175)
            .background(Color.black)
    }
    
    @ViewBuilder func showCellHeader() -> some View {
        Group {
            Text(name)
            HStack {
                Text(airDate)
                Spacer()
                Text(String(format: "%.1f", [rating]))
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
    }
}
