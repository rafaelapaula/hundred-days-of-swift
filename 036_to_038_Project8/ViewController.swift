import UIKit

class ViewController: UIViewController {
  
  let constants = (width: 150, height: 80)
  
  lazy var cluesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "CLUES"
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 24.0)
    label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
    return label
  }()
  
  lazy var answersLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .right
    label.text = "ANSWERS"
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 24.0)
    label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
    return label
  }()
  
  lazy var currentAnswer: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.textAlignment = .center
    textField.placeholder = "Tap letters to guess"
    textField.font = .systemFont(ofSize: 44.0)
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  lazy var scoreLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .right
    label.text = "Score: 0"
    return label
  }()
  
  lazy var submitButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("SUBMIT", for: .normal)
    return button
  }()
  
  lazy var clearButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("CLEAR", for: .normal)
    return button
  }()
  
  lazy var buttonsView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var letterButtons: [UIButton] {
    var buttons = [UIButton]()
    
    for row in 0..<4 {
      for colum in 0..<5 {
        let letterButton = UIButton(type: .system)
        letterButton.titleLabel?.font = .systemFont(ofSize: 36.0)
        letterButton.setTitle("WWW", for: .normal)
        
        letterButton.frame = CGRect(
          x: colum * constants.width,
          y: row * constants.height,
          width: constants.width,
          height: constants.height
        )
        
        buttons.append(letterButton)
      }
    }
    
    return buttons
  }
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = .white
    
    addViews()
    addConstraints()
  }
  
  func addViews() {
    view.addSubview(scoreLabel)
    view.addSubview(cluesLabel)
    view.addSubview(answersLabel)
    view.addSubview(currentAnswer)
    view.addSubview(submitButton)
    view.addSubview(clearButton)
    view.addSubview(buttonsView)
    
    letterButtons.forEach { buttonsView.addSubview($0) }
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
      scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
      
      cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
      cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100.0),
      cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
      
      answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
      answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
      answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
      answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
      
      currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
      
      submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
      submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
      submitButton.heightAnchor.constraint(equalToConstant: 44),
      
      clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
      clearButton.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor),
      clearButton.heightAnchor.constraint(equalToConstant: 44),

      buttonsView.widthAnchor.constraint(equalToConstant: 750),
      buttonsView.heightAnchor.constraint(equalToConstant: 320),
      buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
      buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
    ])
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
