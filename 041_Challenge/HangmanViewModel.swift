import Foundation

protocol HangmanDelegate: Any {
  func didGetAnError(_ message: String)
  func didLoadWord(with hint: String, and word: String)
  func didUpdateWord(_ word: String)
  func didFinishWords()
  func didSucceed()
}

protocol HangmanViewModelProtocol {
  func load()
  func submit(_ letter: Character)
  func next()
}

class HangmanViewModel: HangmanViewModelProtocol {
  
  static var MAX_NUMBER_OF_TRIES = 7
  var tries = MAX_NUMBER_OF_TRIES
  
  var delegate: HangmanDelegate?
  
  var current = Hangman(hint: "", answer: "")
  var word = [Character]()
  var lettersTried = [Character]()
  
  var options = [Hangman]()
  var optionsDone = [Hangman]()
  
  init(delegate: HangmanDelegate? = nil) {
    self.delegate = delegate
  }
  
  func load() {
    clear()
    guard
      let path = Bundle.main.path(forResource: "words", ofType: "json"),
      let data = try? Data(contentsOf: URL(filePath: path)),
      let response = try? JSONDecoder().decode([Hangman].self, from: data)
    else {
      return
    }
    
    options = response.shuffled()
    next()
  }
  
  func submit(_ letter: Character) {
    guard
      tries > 0,
      word.contains("_")
    else {
      delegate?.didGetAnError("You can't try anymore! Restart!")
      return
    }
    
    guard
      !lettersTried.contains(letter)
    else {
      delegate?.didGetAnError("You already tried this letter!")
      tries -= 1
      return
    }
    
    lettersTried.append(letter)
    
    guard 
      current.answer.contains(letter)
    else {
      tries -= 1
      return
    }
    
    let answer = Array(current.answer)
    
    for (i, wordLetter) in word.enumerated() {
      if wordLetter == "_" && answer[i] == letter {
        word[i] = letter
      }
    }
    
    delegate?.didUpdateWord(String(word).uppercased())
    
    if !word.contains("_") {
      optionsDone.append(options.removeLast())
      delegate?.didSucceed()
    }
  }
  
  func clear() {
    lettersTried = []
    word = []
    current = Hangman(hint: "", answer: "")
  }
  
  func next() {
    clear()
    
    guard let item = options.last else {
      delegate?.didFinishWords()
      return
    }
    
    current = item
    word = []
    
    current.answer.forEach { _ in
      word.append("_")
    }
    
    delegate?.didLoadWord(with: current.hint, and: String(word).uppercased())
  }
  
  
}
