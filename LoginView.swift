import SwiftUI
import Stinsen

struct LoginView: View {
    // MARK: - Properties
    @EnvironmentObject var router: MainCoordinator.Router
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        //NavigationView {
        GeometryReader { reader in
            ZStack {
                background
                VStack {
                    header
                        .frame(height: reader.size.height / 2)
                    form
                        .frame(width: reader.size.width * 0.65, height: reader.size.height / 2)
                }
            }
        }
        //}
    }
    
    var background: some View {
        LinearGradient(gradient: Gradient(colors: [Color(.primaryLight), Color(.almostBlack),  Color(.almostBlack)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
    
    var header: some View {
        VStack {
            Image("img_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 110)
        }
    }
    
    var form: some View {
        VStack(spacing: 20) {
            TextEditor(text: $username)
                .frame(height: 50)
                .foregroundColor(.white)
            TextEditor(text: $password)
                .frame(height: 50)
            loginButton
            Spacer()
        }
        .padding(.vertical)
    } 
    
    var loginButton: some View {
        Button(action: {
            print("Log in")
            router.root(\.authenticated)
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
    }
}
