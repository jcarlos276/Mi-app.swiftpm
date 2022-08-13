import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0
    
    var body: some View {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Text("Hello")
                    Spacer()
                    Button(action: {
                        counter += 1
                        print("button pressed N \(counter)")
                    }) { 
                        Text("Continue")
                    }
                }
                .frame(width: .infinity)
                .padding(50)
            }
            .navigationTitle("Test App")
            .navigationBarTitleDisplayMode(.inline)
        }
}
