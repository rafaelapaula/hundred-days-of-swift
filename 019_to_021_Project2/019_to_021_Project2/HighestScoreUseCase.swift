import Foundation

class HighestScoreUseCase {
  let userDefaults = UserDefaults.standard
  let highestLabel = "highestPoint"
  
  func shouldUpdate(_ score: Int) -> Bool {
    let oldHighest = userDefaults.integer(forKey: highestLabel)
    if score > oldHighest {
      userDefaults.set(score, forKey: highestLabel)
      return true
    }
    return false
  }
}
