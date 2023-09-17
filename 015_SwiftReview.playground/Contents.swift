import UIKit

/*
 MARK: Swift review, day three
 https://www.hackingwithswift.com/100/15
 */

/*
 Properties
 https://www.hackingwithswift.com/read/0/17/properties
 */
struct Person {
  var age: Int = -1
  var clothes: String = "" {
    // Property observers
    willSet {
      updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
    }
    
    didSet {
      updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
    }
  }
  var shoes: String = ""
  var ageInDogYears: Int {
    return age * 7 // Computed properties
  }
  
  func describe() {
    print("I like wearing \(clothes) with \(shoes)")
  }
}

func updateUI(msg: String) {
  print(msg)
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
taylor.describe()
other.describe()

var taylor2 = Person(clothes: "T-shirts")
taylor2.clothes = "short skirts"

var fan = Person(age: 25)
print(fan.ageInDogYears)



/*
 Static properties and methods
 https://www.hackingwithswift.com/read/0/18/static-properties-and-methods
 */
struct TaylorFan {
  static var favoriteSong = "Look What You Made Me Do"
  
  var name: String
  var age: Int
  
}
let fan2 = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


/*
 Access control
 https://www.hackingwithswift.com/read/0/19/access-control
 
 MARK: The default access level in Swift is internal. That means that any class you define in your code can be accessed from within your app's module, and not outside of it. This is a sensible default: you want to restrict your code to your module, and not allow outside access.
 
 * Public: this means everyone can read and write the property.
 * Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
 * File Private: this means that only Swift code in the same file as the type can read and write the property.
 * Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.
 */
internal class Test {}


/*
 Polymorphism and typecasting
 https://www.hackingwithswift.com/read/0/20/polymorphism-and-typecasting
 */
class Album {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func getPerformance() -> String {
    return "The album \(name) sold lots"
  }
}

class StudioAlbum: Album {
  var studio: String
  
  init(name: String, studio: String) {
    self.studio = studio
    super.init(name: name)
  }
  
  override func getPerformance() -> String {
    return "The studio album \(name) sold lots"
  }
}

class LiveAlbum: Album {
  var location: String
  
  init(name: String, location: String) {
    self.location = location
    super.init(name: name)
  }
  
  override func getPerformance() -> String {
    return "The live album \(name) sold lots"
  }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

// That's how polymorfism works
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
  print(album.getPerformance())
  
  // That's how typecast works
  if let studioAlbum = album as? StudioAlbum {
    print(studioAlbum.studio)
  } else if let liveAlbum = album as? LiveAlbum {
    print(liveAlbum.location)
  }
}


/*
 Closures
 https://www.hackingwithswift.com/read/0/21/closures
 */
let vw = UIView()
UIView.animate(withDuration: 0.5, animations: {
  // we are inside a closure
  vw.alpha = 0
})




