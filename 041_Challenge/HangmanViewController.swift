import UIKit

class HangmanViewController: UIViewController {
  
  lazy var viewModel: HangmanViewModelProtocol = HangmanViewModel(delegate: self)
  
  lazy var hintLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 32.0, weight: .semibold)
    label.text = "Loading your hint.."
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  lazy var wordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)
    label.text = "_________"
    label.textAlignment = .center
    return label
  }()
  
  lazy var inputTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = .systemFont(ofSize: 12.0, weight: .semibold)
    textField.keyboardType = .alphabet
    textField.returnKeyType = .done
    textField.borderStyle = .roundedRect
    textField.addTarget(self, action: #selector(didTapSubmit), for: .editingDidEndOnExit)
    textField.delegate = self
    return textField
  }()
  
  lazy var submitButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("SUBMIT", for: .normal)
    button.backgroundColor = .lightGray
    button.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
    return button
  }()
  
  lazy var containerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 32.0
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addViews()
    addConstraints()
    view.backgroundColor = .white
    
    viewModel.load()
  }
  
  func addViews() {
    containerStackView.addArrangedSubview(hintLabel)
    containerStackView.addArrangedSubview(wordLabel)
    containerStackView.addArrangedSubview(inputTextField)
    containerStackView.addArrangedSubview(submitButton)
    view.addSubview(containerStackView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      containerStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      containerStackView.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16.0)
    ])
  }
  
  @objc func didTapSubmit() {
    inputTextField.resignFirstResponder()
    guard let text = inputTextField.text?.uppercased().first else { return }
    viewModel.submit(text)
    inputTextField.text = ""
  }
}

extension HangmanViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return textField.text?.count == 0
  }
}

extension HangmanViewController: HangmanDelegate {
  func didGetAnError(_ message: String) {
    showAlert(title: "Oppsss!", message: message, handlerTitle: "Restart") { [weak self] in
      self?.viewModel.load()
    }
  }
  
  func didLoadWord(with hint: String, and word: String) {
    hintLabel.text = hint
    wordLabel.text = word
  }
  
  func didUpdateWord(_ word: String) {
    wordLabel.text = word
  }
  
  func didFinishWords() {
    showAlert(title: "Congrats!", message: "You finished ALL words", handlerTitle: "Restart") { [weak self] in
      self?.viewModel.load()
    }
  }
  
  func didSucceed() {
    showAlert(title: "Congrats!", message: "You discovered the word, let's go to the next?", handlerTitle: "Yes!") { [weak self] in
      self?.viewModel.next()
    }
  }
  
  func showAlert(
    title: String,
    message: String,
    handlerTitle: String? = nil,
    handler: (() -> Void)? = nil) {
      
      let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: handlerTitle ?? "Ok", style: .default) { _ in
        handler?()
      }
      
      ac.addAction(action)
      present(ac, animated: true)
    }
}
