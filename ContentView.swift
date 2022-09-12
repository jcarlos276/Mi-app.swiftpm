import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.primaryLight), Color(.primary),  Color(.primary)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Image("img_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 110)
                    }
                    .frame(height: reader.size.height / 2)
                    VStack(spacing: 20) {
                        TextEditor(text: $username)
                            .frame(height: 50)
                            .foregroundColor(.white)
                        TextEditor(text: $password)
                            .frame(height: 50)
                        Button(action: {
                            print("Log in")
                        }) {
                            Text("Log in")
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background { 
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .foregroundColor(.green)
                                        .frame(width: .infinity)
                                }
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                    .frame(width: reader.size.width * 0.65, height: reader.size.height / 2)
                }
            }
        }
    }
}
