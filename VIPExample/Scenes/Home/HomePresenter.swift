protocol HomePresentationLogic {
    func presentFetchComponentsSucceeded(response: Home.FetchComponents.Success.Response)
    func presentFetchComponentsFailed(response: Home.FetchComponents.Failure.Response)
}

final class HomePresenter {
    weak var viewController: HomeDisplayLogic?
}

// MARK: - HomePresentationLogic

extension HomePresenter: HomePresentationLogic {
    func presentFetchComponentsSucceeded(response: Home.FetchComponents.Success.Response) {
        let formattedTitle = response.title.capitalized
        viewController?.displayFetchComponentsSucceeded(viewModel: .init(title: formattedTitle))
    }
    
    func presentFetchComponentsFailed(response: Home.FetchComponents.Failure.Response) {
        let errorMessage: String
        switch response.error {
        case is DecodingError:
            errorMessage = "Algo deu errado."
        default:
            errorMessage = "Algo deu errado. Tente novamente."
        }
        viewController?.displayFetchComponentsFailed(viewModel: .init(errorMessage: errorMessage))
    }
}
