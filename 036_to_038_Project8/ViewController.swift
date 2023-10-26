import UIKit

class ViewController: UIViewController {
  
  let constants = (width: 150, height: 80)
  
  var activatedButtons = [UIButton]()
  var solutions = [String]()
  
  var score = 0 {
    didSet {
      scoreLabel.text = "Score: \(score - errorsScore)"
    }
  }
  
  var errorsScore = 0 {
    didSet {
      scoreLabel.text = "Score: \(score - errorsScore)"
    }
  }
  
  var level = 1
  
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
    button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    return button
  }()
  
  lazy var clearButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("CLEAR", for: .normal)
    button.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
    return button
  }()
  
  lazy var buttonsView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var letterButtons: [UIButton] = {
    var buttons = [UIButton]()
    
    for row in 0..<4 {
      for colum in 0..<5 {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 36.0)
        button.setTitle("WWW", for: .normal)
        button.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        button.frame = CGRect(
          x: colum * constants.width,
          y: row * constants.height,
          width: constants.width,
          height: constants.height
        )
        
        buttons.append(button)
      }
    }
    
    return buttons
  }()
  
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
    loadLevel()
  }
  
  @objc func letterTapped(_ sender: UIButton) {
    guard let buttonTitle = sender.titleLabel?.text else { return }
    
    currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
    activatedButtons.append(sender)
    sender.isHidden = true
  }
  
  @objc func submitTapped(_ sender: UIButton) {
    guard 
      let answerText = currentAnswer.text,
      let solutionsPosition = solutions.firstIndex(of: answerText)
    else {
      
      errorsScore += 1
      let ac = UIAlertController(title: "Oh no!", message: "You are wrong, try again!", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Ok :(", style: .cancel))
      present(ac, animated: true)
      
      return
    }
    
    activatedButtons.removeAll()
    var splitAnswers = answersLabel.text?.components(separatedBy: "\n")
    splitAnswers?[solutionsPosition] = answerText
    
    answersLabel.text = splitAnswers?.joined(separator: "\n")
    currentAnswer.text = ""
    score += 1
    
    if score % 7 == 0 {
      let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
      present(ac, animated: true)
    }
  }
  
  func levelUp(action: UIAlertAction) {
    level += 1
    solutions.removeAll(keepingCapacity: true)
    
    loadLevel()
    
    for btn in letterButtons {
      btn.isHidden = false
    }
  }
  
  @objc func clearTapped(_ sender: UIButton) {
    currentAnswer.text = ""
    
    activatedButtons.forEach { $0.isHidden = false }
    activatedButtons.removeAll()
  }
  
  func loadLevel() {
    var clueString = ""
    var solutionsString = ""
    var letterBits = [String]()
    
    if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"),
       let levelContents = try? String(contentsOf: levelFileURL) {
      
      var lines = levelContents.components(separatedBy: "\n")
      lines.shuffle()
      
      for (index, line) in lines.enumerated() {
        let parts = line.components(separatedBy: ": ")
        let answer = parts[0]
        let clue = parts[1]
        
        clueString += "\(index + 1). \(clue)\n"
        
        let solutionWord = answer.replacingOccurrences(of: "|", with: "")
        solutionsString += "\(solutionWord.count) letters\n"
        solutions.append(solutionWord)
        
        let bits = answer.components(separatedBy: "|")
        letterBits += bits
      }
    }
    
    cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
    answersLabel.text = solutionsString.trimmingCharacters(in: .whitespacesAndNewlines)
    
    letterButtons.shuffle()
    
    if letterButtons.count == letterBits.count {
      for i in 0..<letterButtons.count {
        letterButtons[i].setTitle(letterBits[i], for: .normal)
      }
    }
  }
}
