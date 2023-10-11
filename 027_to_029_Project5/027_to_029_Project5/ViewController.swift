//
//  ViewController.swift
//  027_to_029_Project5
//
//  Created by rafaela.lourenco on 11/10/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var allWords = [String]()
  var usedWords = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
    
    if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
       let startWords = try? String(contentsOf: startWordsURL) {
      allWords = startWords.components(separatedBy: "\n")
    } else {
      allWords = ["silkworm"]
    }
    
    startGame()
  }

  func startGame() {
    title = allWords.randomElement()
    usedWords.removeAll(keepingCapacity: true)
    tableView.reloadData()
  }
  
  @objc func promptForAnswer() {
    let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
    ac.addTextField()
    
    let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
      guard let answer = ac?.textFields?.first?.text else { return }
      self?.submit(answer)
    }
    
    ac.addAction(submitAction)
    present(ac, animated: true)
  }
  
  func submit(_ answer: String) {
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    usedWords.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = usedWords[indexPath.row]
    return cell
  }
}

