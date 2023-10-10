import UIKit

protocol ViewCodable {
  func setup()
  func addViews()
  func addConstraints()
}

extension ViewCodable {
  func setup() {
    addViews()
    addConstraints()
  }
}

class MainViewController: UIViewController, ViewCodable {
  
  // MARK: Attributes
  
  lazy var viewCodeButton = {
    let button = UIButton()
    button.setTitle("ViewCode solution", for: .normal)
    button.backgroundColor = .gray.withAlphaComponent(0.7)
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(didSelectViewCodeSolution), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var optionsStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fillEqually
    stackView.alignment = .fill
    stackView.axis = .vertical
    stackView.spacing = 16.0
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  // MARK: Setup
  
  func setup() {
    view.backgroundColor = .white
    addViews()
    addConstraints()
  }
  
  func addViews() {
    optionsStackView.addArrangedSubview(viewCodeButton)
    view.addSubview(optionsStackView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      optionsStackView.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 40),
      optionsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
      optionsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
      optionsStackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -40.0)
    ])
  }
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  // MARK: Actions
  
  @objc func didSelectViewCodeSolution(sender: UIButton) {
    let viewController = SitesListViewController()
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}


