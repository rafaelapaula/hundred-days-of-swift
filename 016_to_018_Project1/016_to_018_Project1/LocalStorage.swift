import Foundation

class LocalStorage {
  private let defaults = UserDefaults.standard
  
  private let prefixImage = "image.views."
  
  func viewed(image path: String) {
    var count = views(for: path) + 1
    defaults.set(count, forKey: "\(prefixImage)\(path)")
  }
  
  func views(for path: String) -> Int {
    defaults.integer(forKey: "\(prefixImage)\(path)")
  }
}
