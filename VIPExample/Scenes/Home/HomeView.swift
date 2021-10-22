import UIKit

protocol HomeViewProtocol: UIView {
    func displayLoading(isVisible: Bool)
    func displayTitle(_ title: String)
}

final class HomeView: UIView {
    
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .black
        return indicator
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Navegar para outra tela", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: - ViewCode

extension HomeView {
    private func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfigurations()
    }
    
    private func setupComponents() {
        addSubview(titleLabel)
        addSubview(button)
        addSubview(loadingIndicator)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40)
        ])
    }
    
    private func setupExtraConfigurations() {
        backgroundColor = .white
    }
}

// MARK: - HomeViewProtocol

extension HomeView: HomeViewProtocol {
    func displayLoading(isVisible: Bool) {
        if isVisible {
            loadingIndicator.isHidden = false
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.isHidden = true
            loadingIndicator.stopAnimating()
        }
    }
    
    func displayTitle(_ title: String) {
        titleLabel.text = title
    }
}
