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
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    usedWords.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = usedWords[indexPath.row]
    return cell
  }
}

extension ViewController {
  func submit(_ answer: String) {
    let lowercased = answer.lowercased()
    
    var hasError = false
    var errorTitle = "Error"
    var errorMessage = "Your word is not: ["
    
    if !isPossible(word: lowercased) {
      hasError = true
      errorMessage += " possible "
    }
    
    if !isOriginal(word: lowercased) {
      hasError = true
      errorMessage += " original "
    }
    
    if !isReal(word: lowercased) {
      hasError = true
      errorMessage += " real "
    }
    
    guard
      !hasError
    else {
      errorMessage += "]"
      let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .cancel))
      present(ac, animated: true)
      return
    }
    
    usedWords.insert(answer, at: 0)
    tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
  }
  
  func isPossible(word: String) -> Bool {
    guard let title = title, word.count > 0, title.count > 0 else { return false }
    
    var sortedWord = Array(word.sorted())
    let titleSorted = Array(title.lowercased().sorted())
    
    var titleIndex = titleSorted.count
    
    first: while titleIndex > 0 {
      guard let letter = sortedWord.last else { return true }
      
      second: while titleIndex > 0 {
        titleIndex -= 1
        if letter == titleSorted[titleIndex] {
          sortedWord.removeLast()
          break second
        }
      }
    }
    
    return sortedWord.count == 0
  }
  
  func isOriginal(word: String) -> Bool {
    !usedWords.contains(word)
  }
  
  func isReal(word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    return misspelledRange.location == NSNotFound
  }
}

