import Foundation

protocol HomeBusinessLogic {
    func fetchComponents(request: Home.FetchComponents.Request)
}

final class HomeInteractor {
    private let presenter: HomePresentationLogic
    
    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
    }
}

// MARK: - HomeBusinessLogic

extension HomeInteractor: HomeBusinessLogic {
    func fetchComponents(request: Home.FetchComponents.Request) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [presenter] in
            presenter.presentFetchComponentsSucceeded(response: .init(title: "Sucesso!"))
        }
    }
}


