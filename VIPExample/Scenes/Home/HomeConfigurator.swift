import UIKit

final class HomeConfigurator {
    func resolve() -> UIViewController {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let homeView = HomeView()
        let viewController = HomeViewController(interactor: interactor, customView: homeView)
        presenter.viewController = viewController
        return viewController
    }
}
