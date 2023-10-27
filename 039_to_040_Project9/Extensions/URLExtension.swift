import Foundation

extension URL {
  static func recentPetitions() -> URL {
    URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json")!
  }
  
  static func topRatedPetitions() -> URL {
    URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
  }
}
