import UIKit

/*
 MARK: Swift review, day two
 https://www.hackingwithswift.com/100/14
 */

/*
 Functions
 https://www.hackingwithswift.com/read/0/11/functions
 */
func favoriteAlbum(name: String) {
  print("My favorite is \(name)")
}
favoriteAlbum(name: "Fearless")

func printAlbumRelease(name: String, year: Int) {
  print("\(name) was released in \(year)")
}
printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

func countLetters(in string: String) {
  print("The string \(string) has \(string.count) letters")
}
countLetters(in: "Hello")

func albumIsTaylors(name: String) -> Bool {
  if name == "Taylor Swift" { return true }
  if name == "Fearless" { return true }
  if name == "Speak Now" { return true }
  if name == "Red" { return true }
  if name == "1989" { return true }
  
  return false
}

if albumIsTaylors(name: "Red") {
  print("That's one of hers!")
} else {
  print("Who made that?!")
}

if albumIsTaylors(name: "Blue") {
  print("That's one of hers!")
} else {
  print("Who made that?!")
}


/*
 Optionals
 https://www.hackingwithswift.com/read/0/12/optionals
 */

func getHaterStatus(weather: String) -> String? {
  if weather == "sunny" {
    return nil
  } else {
    return "Hate"
  }
}

var status: String?
status = getHaterStatus(weather: "rainy")

func takeHaterAction(status: String) {
  if status == "Hate" {
    print("Hating")
  }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
  takeHaterAction(status: haterStatus)
}

func yearAlbumReleased(name: String) -> Int? {
  if name == "Taylor Swift" { return 2006 }
  if name == "Fearless" { return 2008 }
  if name == "Speak Now" { return 2010 }
  if name == "Red" { return 2012 }
  if name == "1989" { return 2014 }
  
  return nil
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int {
  for i in 0..<array.count {
    if array[i] == string {
      return i
    }
  }
  
  return 0
}

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

var year = yearAlbumReleased(name: "Red")

if year == nil {
  print("There was an error")
} else {
  print("It was released in \(year ?? 0)")
}


/*
 Optional chaining
 https://www.hackingwithswift.com/read/0/13/optional-chaining
 */

func albumReleased(year: Int) -> String? {
  switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
  }
}

let album = albumReleased(year: 2006)?.uppercased() // Optional chaining
print("The album is \(album)")


let album2 = albumReleased(year: 2006) ?? "unknown" // this is a default value
print("The album is \(album2)")


/*
 Enumerations
 https://www.hackingwithswift.com/read/0/14/enumerations
 */
enum WeatherType {
  case sun, cloud, rain, snow
  case wind(speed: Int)
}

func getHaterStatus(weather: WeatherType) -> String? {
  switch weather {
    case .sun:
      return nil
    case .wind(let speed) where speed < 10:
      return "meh"
    case .cloud, .wind:
      return "dislike"
    case .rain, .snow:
      return "hate"
  }
}

getHaterStatus(weather: .wind(speed: 5))


/*
 Structs
 https://www.hackingwithswift.com/read/0/15/structs
 */
struct Person {
  var clothes: String
  var shoes: String
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)

// There’s one more thing you ought to know but can't see in that code: when you write a function inside a struct, it's called a method instead. In Swift you write func whether it's a function or a method, but the distinction is preserved when you talk about them.


/*
 Classes
 https://www.hackingwithswift.com/read/0/16/classes
 */
class Person2 {
  var clothes: String
  var shoes: String
  
  init(clothes: String, shoes: String) {
    self.clothes = clothes
    self.shoes = shoes
  }
}

class Singer {
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  func sing() {
    print("La la la la")
  }
}

class CountrySinger: Singer {
  override func sing() {
    print("Trucks, guitars, and liquor")
  }
}

var taylor2 = CountrySinger(name: "Taylor", age: 25)
taylor2.sing()

class HeavyMetalSinger: Singer {
  var noiseLevel: Int
  
  init(name: String, age: Int, noiseLevel: Int) {
    self.noiseLevel = noiseLevel
    super.init(name: name, age: age)
  }
  
  override func sing() {
    print("Grrrrr rargh rargh rarrrrgh!")
  }
}
