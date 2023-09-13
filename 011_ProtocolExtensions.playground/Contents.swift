import UIKit

/*
 MARK: Protocols and extensions
 https://www.hackingwithswift.com/100/11
 */

/*
 Protocols
 https://www.hackingwithswift.com/sixty/9/1/protocols
 */
protocol Identifiable {
  var id: String { get set }
}

struct User: Identifiable {
  var id: String
}

func displayID(thing: Identifiable) {
  print("My ID is \(thing.id)")
}

displayID(thing: User(id: "12345"))


/*
 Protocol inheritance
 https://www.hackingwithswift.com/sixty/9/2/protocol-inheritance
 */
protocol Payable {
  func calculateWages() -> Int
}
protocol NeedsTraining {
  func study()
}
protocol HasVacation {
  func takeVacation(days: Int)
}

// Now we can make new types conform to that single protocol rather than each of the three individual ones.
protocol Employee: Payable, NeedsTraining, HasVacation { }


/*
 Extensions
 https://www.hackingwithswift.com/sixty/9/3/extensions
 */
extension Int {
  func squared() -> Int { self * self }
}

let number = 8
number.squared()

// Extensions must not contain stored properties, only computed properties
extension Int {
  var isEven: Bool { self % 2 == 0 }
}


/*
 Protocol extensions
 https://www.hackingwithswift.com/sixty/9/4/protocol-extensions
 
 Protocols let you describe what methods something should have, but don’t provide the code inside. Extensions let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.
 */
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

// Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly

extension Collection {
  func summarize() {
    print("There are \(count) of us:")
    for name in self {
      print(name)
    }
  }
}
pythons.summarize()
beatles.summarize()


/*
 Protocol-oriented programming
 https://www.hackingwithswift.com/sixty/9/5/protocol-oriented-programming
 */
protocol Identifiable2 {
  var ID: String { get set }
  func identify()
}
extension Identifiable2 {
  func identify() {
    print("My ID is \(ID).")
  }
}
struct User2: Identifiable2 {
  var ID: String
}

let twostraws = User2(ID: "twostraws")
twostraws.identify()

/*
 How is protocol-oriented programming different from object-oriented programming?
 
 Getting down to the raw facts, there is no practical difference between the two: both can place functionality into objects, use access control to limit where that functionality can be called, make one class inherit from another, and more.
 
 Some might say that the only real difference between the two is that in protocol-oriented programming (POP) we prefer to build functionality by composing protocols (“this new struct conforms to protocols X, Y, and Z”), whereas in object-oriented programming (OOP) we prefer to build functionality through class inheritance. However, even that is dubious because OOP developers also usually prefer composing functionality to inheriting it – it’s just easier to maintain.
 
 In fact, the only important difference between the two is one of mindset: POP developers lean heavily on the protocol extension functionality of Swift to build types that get a lot of their behavior from protocols. This makes it easier to share functionality across many types, which in turn lets us build bigger, more powerful software without having to write so much code.
 */


/*
 Protocols and extensions summary
 https://www.hackingwithswift.com/sixty/9/6/protocols-and-extensions-summary
 
 You’ve made it to the end of the ninth part of this series, so let’s summarize:
 
 01) Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
 02) You can build protocols on top of other protocols, similar to classes.
 03) Extensions let you add methods and computed properties to specific types such as Int.
 04) Protocol extensions let you add methods and computed properties to protocols.
 05) Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
 */
