import SwiftUI
import Stinsen

final class UnauthenticatedCoordinator: NavigationCoordinatable {
    var stack: NavigationStack<UnauthenticatedCoordinator> = .init(initial: \UnauthenticatedCoordinator.start)
    
    @Root var start = makeStart
    
    func makeStart() -> some View {
        LoginView()
    }
}
