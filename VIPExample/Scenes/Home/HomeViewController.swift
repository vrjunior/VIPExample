import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayFetchComponentsSucceeded(viewModel: Home.FetchComponents.Success.ViewModel)
    func displayFetchComponentsFailed(viewModel: Home.FetchComponents.Failure.ViewModel)
}

final class HomeViewController: UIViewController {
    private let interactor: HomeBusinessLogic
    private let customView: HomeViewProtocol
    
    init(
        interactor: HomeBusinessLogic,
        customView: HomeViewProtocol
    ) {
        self.interactor = interactor
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.displayLoading(isVisible: true)
        interactor.fetchComponents(request: .init())
    }
}

// MARK: - HomeDisplayLogic

extension HomeViewController: HomeDisplayLogic {
    func displayFetchComponentsSucceeded(viewModel: Home.FetchComponents.Success.ViewModel) {
        customView.displayLoading(isVisible: false)
        customView.displayTitle(viewModel.title)
    }
    
    func displayFetchComponentsFailed(viewModel: Home.FetchComponents.Failure.ViewModel) {
        customView.displayLoading(isVisible: false)
        customView.displayTitle(viewModel.errorMessage) // Poderia exibir um toast de erro aqui.
    }
}
