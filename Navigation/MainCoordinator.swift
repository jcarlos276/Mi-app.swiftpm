import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
let stack = NavigationStack(initial: \MainCoordinator.start)
    
    @Root var start = makeStart
    @Root var authenticated = makeAuthenticated
    @Root var unauthenticated = makeUnauthenticated
    
    func makeStart() -> some View {
        LoginView()
    }
    
    func makeUnauthenticated() -> NavigationViewCoordinator<UnauthenticatedCoordinator> {
        UnauthenticatedCoordinator().eraseToNavigationCoordinator()
    }
    
    func makeAuthenticated() -> NavigationViewCoordinator<AuthenticatedCoordinator> {
        AuthenticatedCoordinator().eraseToNavigationCoordinator()
    }
}
