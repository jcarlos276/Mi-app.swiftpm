import SwiftUI
import Stinsen

final class AuthenticatedCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AuthenticatedCoordinator.start)
    
    @Root var start = makeStart
    
    func makeStart() -> some View {
        HomeView()
    }
}
