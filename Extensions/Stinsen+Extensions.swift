import Stinsen

extension NavigationCoordinatable {
    func eraseToNavigationCoordinator() -> NavigationViewCoordinator<Self> {
        return NavigationViewCoordinator(self)
    }
}
