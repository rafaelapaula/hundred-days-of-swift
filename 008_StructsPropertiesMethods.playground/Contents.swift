import UIKit

/*
 MARK: Structs, part one
 https://www.hackingwithswift.com/100/8
 */

/*
 Creating your own structs
 https://www.hackingwithswift.com/sixty/7/1/creating-your-own-structs
 
 A tuple is effectively just a struct without a name, like an anonymous struct
 Use tuples when you want to return two or more arbitrary pieces of values from a function, but prefer structs when you have some fixed data you want to send or receive multiple times
 */

struct Sport  {
  var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"

/*
 Computed properties
 https://www.hackingwithswift.com/sixty/7/2/computed-properties
 
 Properties let us attach information to structs, and Swift gives us two variations: stored properties, where a value is stashed away in some memory to be used later, and computed properties, where a value is recomputed every time it’s called. Behind the scenes, a computed property is effectively just a function call that happens to belong to your struct.
 
 Deciding which to use depends partly on whether your property’s value depends on other data, and partly also on performance.
 The performance part is easy: if you regularly read the property when its value hasn’t changed, then using a stored property will be much faster than using a computed property. On the other hand, if your property is read very rarely and perhaps not at all, then using a computed property saves you from having to calculate its value and store it somewhere.
 */
struct Sport2 {
  var name: String
  var isOlimpicSport: Bool
  
  var olympicStatus: String {
    if isOlimpicSport {
      return "\(name) is an Olympic sport"
    } else {
      return "\(name) is not an Olympic sport"
    }
  }
}
let chessBoxing = Sport2(name: "Chessboxing", isOlimpicSport: false)
print(chessBoxing.olympicStatus)


/*
 Property observers
 https://www.hackingwithswift.com/sixty/7/3/property-observers
 
 Iy's not [ossible to have a computed property in an enum
 */
struct Progress {
  var task: String
  var amount: Int {
    didSet {
      print("\(task) is now \(amount)% complete")
    }
    willSet {
      print("\(task) will be \(newValue)% complete")
    }
  }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


/*
 Methods
 https://www.hackingwithswift.com/sixty/7/4/methods
 
 What’s the difference between a function and a method?
 Methods belong to a type, such as structs, enums, and classes, whereas functions do not
 */
struct City {
  var population: Int
  
  func collectTaxes() -> Int {
    return population * 1000
  }
}
let london = City(population: 9_000_000)
london.collectTaxes()


/*
 Mutating methods
 https://www.hackingwithswift.com/sixty/7/5/mutating-methods
 
 There are two important details you’ll find useful:
 
 01) Marking methods as mutating will stop the method from being called on constant structs, even if the method itself doesn’t actually change any properties. If you say it changes stuff, Swift believes you!
 02) A method that is not marked as mutating cannot call a mutating function – you must mark them both as mutating.
 */
struct Person {
  var name: String
  
  /*
   Swift won’t let you write methods that change properties unless you specifically request it. You need to mark it using the mutating keyword, like this:
   */
  mutating func makeAnonymous() {
    name = "Anonymous"
  }
}
var person = Person(name: "Ed")
person.makeAnonymous() // Because it changes the property, Swift will only allow that method to be called on Person instances that are variables



/*
 Properties and methods of strings
 https://www.hackingwithswift.com/sixty/7/6/properties-and-methods-of-strings
 Strings are structs
 */
let string = "Do or do not, there's no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())


/*
 Properties and methods of arrays
 https://www.hackingwithswift.com/sixty/7/7/properties-and-methods-of-arrays
 */
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
