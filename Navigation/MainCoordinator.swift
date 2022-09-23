import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
let stack = NavigationStack(initial: \MainCoordinator.start)
    
    @Root var start = makeStart
    @Root var home = makeHome
    
    func makeStart() -> some View {
        LoginView()
    }
    
    func makeHome() -> some View {
        HomeView()
    }
}
