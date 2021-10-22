import UIKit

protocol HomeRoutingLogic {
    func routeToDetails()
}

final class HomeRouter {
    weak var viewController: UIViewController?
}

// MARK: - HomeRoutingLogic

extension HomeRouter: HomeRoutingLogic {
    func routeToDetails() {
        // TODO
    }
}
