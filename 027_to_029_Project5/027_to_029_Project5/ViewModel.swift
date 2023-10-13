//
//  ViewModel.swift
//  027_to_029_Project5
//
//  Created by rafaela.lourenco on 13/10/23.
//

import UIKit

protocol ViewModelProtocol {
  var inputedWords: [String] { get }
  
  func load()
  func play()
  func submit(_ answer: String)
}

protocol AnagramDelegate {
  func didStartRound(with word: String)
  func didGetAnError(_ message: String)
  func insertRow(at indexPath: IndexPath)
}

class ViewModel: ViewModelProtocol {
  let MIN_COUNT = 3
  
  var words = [String]()
  var inputedWords = [String]()
  var currentWord = ""
  
  var delegate: AnagramDelegate?
  
  init(delegate: AnagramDelegate? = nil) {
    self.delegate = delegate
  }
  
  func load() {
    if let wordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
       let words = try? String(contentsOf: wordsURL) {
      self.words = words.components(separatedBy: "\n")
      play()
    } else {
      delegate?.didGetAnError("No bundle URL for words :(")
    }
  }
  
  func play() {
    currentWord = words.randomElement() ?? ""
    inputedWords = []
    delegate?.didStartRound(with: currentWord)
  }
  
  func submit(_ answer: String) {
    
    guard answer.count >= MIN_COUNT else {
      prepare(for: [.isTooShort])
      return
    }
    
    var errors = [AnagramErrors]()
    
    if !isPossible(answer) { errors.append(.isNotValid) }
    if !isReal(answer) { errors.append(.isNotReal) }
    if !isOriginal(answer) { errors.append(.isNotOriginal) }
    
    guard errors.isEmpty
    else {
      prepare(for: errors)
      return
    }
    
    inputedWords.insert(answer, at: 0)
    delegate?.insertRow(at: IndexPath(row: 0, section: 0))
  }
  
}

extension ViewModel {
  
  func prepare(for errors: [AnagramErrors]) {
    var message = "Your word has the following problem(s):\n"
    errors.forEach { message += "- \($0.rawValue) \n" }
    
    delegate?.didGetAnError(message)
  }
  
  func isPossible(_ word: String) -> Bool {
    guard word.count > 0 else { return false }
    
    var sortedWord = Array(word.sorted())
    let currentWordSorted = Array(currentWord.lowercased().sorted())
    
    var currentIndex = currentWordSorted.count
    
    while currentIndex > 0 {
      guard let letter = sortedWord.last else { return true }
      
    checker: while currentIndex > 0 {
        currentIndex -= 1
        if letter == currentWordSorted[currentIndex] {
          sortedWord.removeLast()
          break checker
        }
      }
    }
    
    return sortedWord.count == 0
  }
  
  func isOriginal(_ word: String) -> Bool {
    currentWord.lowercased() != word && !inputedWords.contains(word)
  }
  
  func isReal(_ word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    return misspelledRange.location == NSNotFound
  }
}
