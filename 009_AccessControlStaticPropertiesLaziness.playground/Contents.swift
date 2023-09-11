import UIKit

/*
 MARK: Structs, part two
 https://www.hackingwithswift.com/100/9
 */


/*
 Initializers
 https://www.hackingwithswift.com/sixty/7/8/initializers
 */
struct User {
  var username: String
}
var user = User(username: "twostraws")

struct UserWitInit {
  var username: String
  init() {
    username = "Anonymous"
    print("Creating a new user!")
  }
}
var userWitInit = UserWitInit()
userWitInit.username = "twostraws"

struct Employee {
  var name: String
  var yearsActive = 0
}
extension Employee {
  init() {
    self.name = "Anonymous"
    print("Creating an anonymous employee…")
  }
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()


/*
 Referring to the current instance
 https://www.hackingwithswift.com/sixty/7/9/referring-to-the-current-instance
 
 Outside of initializers, the main reason for using self is because we’re in a closure and Swift requires it so we’re clear we understand what’s happening.
 This is only needed when accessing self from inside a closure that belongs to a class, and Swift will refuse to build your code unless you add it.
 */
struct Person {
  var name: String
  
  init(name: String) {
    print("\(name) was born!")
    self.name = name
  }
}



/*
 Lazy properties
 https://www.hackingwithswift.com/sixty/7/10/lazy-properties
 */
struct FamilyTree {
  init() {
    print("Creating family tree!")
  }
}

struct Person2 {
  var name: String
  //  If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed
  lazy var familyTree = FamilyTree()
  
  init(name: String) {
    self.name = name
  }
}

var ed = Person2(name: "Ed")
ed.familyTree


/*
 Static properties and methods
 https://www.hackingwithswift.com/sixty/7/11/static-properties-and-methods
*/
struct Student {
  static var classSize = 0
  var name: String
  
  init(name: String) {
    self.name = name
    Student.classSize += 1
  }
}
let anna = Student(name: "Anna")
let taylor = Student(name: "Taylor")
print(Student.classSize)


/*
 Access control
 https://www.hackingwithswift.com/sixty/7/12/access-control
 */
struct Person3 {
  private var id: String
  
  init(id: String) {
    self.id = id
  }
  
  func identify() -> String {
    "My social secutiry number is \(id)"
  }
}

let rafa = Person3(id: "12345")

/*
 Structs summary
 https://www.hackingwithswift.com/sixty/7/13/structs-summary
 
 01) You can create your own types using structures, which can have their own properties and methods.
 02) You can use stored properties or use computed properties to calculate values on the fly.
 03) If you want to change a property inside a method, you must mark it as mutating.
 04) Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 05) Use the self constant to refer to the current instance of a struct inside a method.
 06) The lazy keyword tells Swift to create properties only when they are first used.
 07) You can share properties and methods across all instances of a struct using the static keyword.
 08) Access control lets you restrict what code can use properties and methods.
 */
