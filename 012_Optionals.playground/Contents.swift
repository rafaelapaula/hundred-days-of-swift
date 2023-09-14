import UIKit

/*
 MARK: Optionals
 https://www.hackingwithswift.com/100/12
 */


/*
 Handling missing data
 https://www.hackingwithswift.com/sixty/10/1/handling-missing-data
 */
var age: Int? = nil
age = 38


/*
 Unwrapping optionals
 https://www.hackingwithswift.com/sixty/10/2/unwrapping-optionals
 */
var name: String? = nil
if let unwrapped = name {
  print("\(unwrapped.count) letters")
} else {
  print("Missing name")
}


/*
 Unwrapping with guard
 https://www.hackingwithswift.com/sixty/10/3/unwrapping-with-guard
 
 When to use guard let rather than if let?
 
 Use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.
 */
func greet(_ name: String?) {
  guard let unwrapped = name else {
    print("You didn't provide a name!")
    return
  }
  
  print("Hello, \(unwrapped)!")
}
greet("Rafa")


/*
 Force unwrapping
 https://www.hackingwithswift.com/sixty/10/4/force-unwrapping
 
 Before moving on, I want to reiterate one key point here: if you’re only 99% certain that a force unwrap is safe, you shouldn’t use it. Heck, even if you’re 99.999% certain that it’s safe, you shouldn’t be using it – that equates to one crash in 100,000, which is really bad. Instead, force unwraps should be reserved for times when your code is absolutely guaranteed to be safe, as demonstrated above.
 */
let str = "5"
let num = Int(str)! // Swift will immediately unwrap the optional and make num a regular Int rather than an Int?. But if you’re wrong – if str was something that couldn’t be converted to an integer – your code will crash.
print(num)


/*
 Implicitly unwrapped optionals
 https://www.hackingwithswift.com/sixty/10/5/implicitly-unwrapped-optionals
 
 Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it. Because you know they will have a value by the time you need them, it’s helpful not having to write if let all the time.
 
 That being said, if you’re able to use regular optionals instead it’s generally a good idea.
 */
let age2: Int! = nil


/*
 Nil coalescing
 https://www.hackingwithswift.com/sixty/10/6/nil-coalescing
 */
func username(for id: Int) -> String? {
  if id == 1 {
    return "Taylor Swift"
  } else {
    return nil
  }
}
let user = username(for: 15) ?? "Anonymous"


/*
 Optional chaining
 https://www.hackingwithswift.com/sixty/10/7/optional-chaining
 */
let names = ["John", "Paul", "George"]
let beatle = names.first?.uppercased()


/*
 Optional try
 https://www.hackingwithswift.com/sixty/10/8/optional-try
 
 When should you use optional try?
 
 If you want to run a function and care only that it succeeds or fails – you don’t need to distinguish between the various reasons why it might fail – then using optional try is a great fit, because you can boil the whole thing down to “did it work?”
 */
enum PasswordError: Error {
  case obvious
}

func checkPassword(_ password: String) throws -> Bool {
  if password == "password" {
    throw PasswordError.obvious
  }
  
  return true
}

do {
  try checkPassword("password")
  print("That password is good!")
} catch {
  print("You can't use that password.")
}

if let result = try? checkPassword("password") {
  print("Result was \(result)")
} else {
  print("D'oh.")
}

try! checkPassword("sekrit")  // The other alternative is try!, which you can use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.
print("OK!")


/*
 Failable initializers
 https://www.hackingwithswift.com/sixty/10/9/failable-initializers
 */
struct Person {
  var id: String
  
  init?(id: String) {
    if id.count == 9 {
      self.id = id
    } else {
      return nil
    }
  }
}


/*
 Typecasting
 https://www.hackingwithswift.com/sixty/10/10/typecasting
 */
class Animal {}
class Fish: Animal {}
class Dog: Animal {
  func makeNoise() {
    print("Woof!")
  }
}
let pets = [Fish(), Dog(), Dog()]
for pet in pets {
  if let dog = pet as? Dog {
    dog.makeNoise()
  }
}

/*
 Optionals summary
 https://www.hackingwithswift.com/sixty/10/11/optionals-summary
 
 01) Optionals let us represent the absence of a value in a clear and unambiguous way.
 02) Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
 03) You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
 04) Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
 05) You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
 06) Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
 07) You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
 08) If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
 09) You can use typecasting to convert one type of object to another.
 */
func valor() throws -> String {
  return ""
}
