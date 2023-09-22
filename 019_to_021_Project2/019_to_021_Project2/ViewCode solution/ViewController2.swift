//
//  ViewController2.swift
//  019_to_021_Project2
//
//  Created by rafaela.lourenco on 22/09/23.
//

import UIKit

class ViewController2: UIViewController, ViewCodable {
  
  var countries = [String]()
  var score = 0
  var correctAnswer = 0
  var counter = 0
  
  lazy var button1: UIButton = {
    var button = UIButton(type: .custom)
    button.setImage(UIImage(named: "us"), for: .normal)
    button.tag = 0
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    button.frame.size = CGSize(width: 200.0, height: 100.0)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var button2: UIButton = {
    var button = UIButton(type: .custom)
    button.setImage(UIImage(named: "us"), for: .normal)
    button.tag = 1
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    button.frame.size = CGSize(width: 200.0, height: 100.0)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var button3: UIButton = {
    var button = UIButton(type: .custom)
    button.setImage(UIImage(named: "us"), for: .normal)
    button.tag = 2
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    button.frame.size = CGSize(width: 200.0, height: 100.0)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setup()
    loadImages()
  }
  
  func addViews() {
    view.addSubview(button1)
    view.addSubview(button2)
    view.addSubview(button3)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0),
      button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30.0),
      button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30.0),
      button3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    ])
  }
  
  func loadImages() {
    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    askQuestion()
  }
  
  func restart(action: UIAlertAction? = nil) {
    score = 0
    counter = 0
    title = countries[correctAnswer].uppercased() + " | Score: \(score)"
  }
  
  func askQuestion(action: UIAlertAction? = nil) {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
    
    title = countries[correctAnswer].uppercased() + " | Score: \(score)"
  }
  
  @objc func buttonTapped(_ sender: UIButton) {
    var title: String
    var message: String
    var image: UIImage?
    
    if sender.tag == correctAnswer {
      title = "Correct"
      score += 1
      message = "Your score is \(score)"
    } else {
      title = "Wrong"
      score -= 1
      message = "Your score is \(score)\nThat's the flag of \(countries[correctAnswer].uppercased())"
      image = UIImage(named: countries[correctAnswer])
    }
    
    if counter >= 10 {
      endOfGame()
      return
    } else {
      counter += 1
    }
    
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
    action.setValue(image?.withRenderingMode(.alwaysOriginal), forKey: "image")
    ac.addAction(action)
    present(ac, animated: true)
    
    self.title = countries[correctAnswer].uppercased() + " | Score: \(score)"
  }
  
  func endOfGame() {
    let ac = UIAlertController(title: "End of game!", message: "Your score is \(score)", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: restart))
    present(ac, animated: true)
  }
}
