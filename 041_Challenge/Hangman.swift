import Foundation

struct HangmanResponse: Codable {
  let options: [Hangman]
}

struct Hangman: Codable {
  let hint: String
  let answer: String
}
