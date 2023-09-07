import UIKit

/*
 MARK: Functions
 https://www.hackingwithswift.com/100/5
 */

/*
 Writing functions
 https://www.hackingwithswift.com/sixty/5/1/writing-functions
 */
func printHelp() {
  let message = """
Welcome to my App!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
  
  print(message)
}
printHelp()

/*
 Accepting parameters
 https://www.hackingwithswift.com/sixty/5/2/accepting-parameters
 */
func square(number: Int) {
  print(number * number)
}
square(number: 3)


/*
 Returning values
 https://www.hackingwithswift.com/sixty/5/3/returning-values
 */
func square2(number: Int) -> Int {
  number * number
}
let result = square2(number: 8)
print(result)


/*
 Parameter labels
 https://www.hackingwithswift.com/sixty/5/4/parameter-labels
 */
func sayHello(to name: String) {
  print("Hi \(name)!")
}
sayHello(to: "Rafa")


/*
 Omitting parameter labels
 https://www.hackingwithswift.com/sixty/5/5/omitting-parameter-labels
 
 The main reason for skipping a parameter name is when your function name is a verb and the first parameter is a noun the verb is acting on. For example:
 
 01) Greeting a person would be greet(taylor) rather than greet(person: taylor)
 02) Buying a product would be buy(toothbrush) rather than buy(item: toothbrush)
 03) Finding a customer would be find(customer) rather than find(user: customer)
 
 This is particularly important when the parameter label is likely to be the same as the name of whatever you’re passing in:
 
 01) Singing a song would be sing(song) rather than sing(song: song)
 02) Enabling an alarm would be enable(alarm) rather than enable(alarm: alarm)
 03) Reading a book would be read(book) rather than read(book: book)
 
 */
func greet(_ person: String) {
  print("Hello, \(person)")
}
greet("Anna")

/*
 Default parameters
 https://www.hackingwithswift.com/sixty/5/6/default-parameters
 */
func greet(_ person: String, nicely: Bool = true) {
  if nicely {
    print("Hello, \(person)!")
  } else {
    print("Oh no, it's \(person) again...")
  }
}
greet("Taylor")
greet("Taylor", nicely: false)



/*
 Variadic functions
 https://www.hackingwithswift.com/sixty/5/7/variadic-functions
 
 You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds.
 */
print("Haters", "gonna", "hate")
func square3(numbers: Int...) {
  for number in numbers {
    print("\(number) squared is \(number * number)")
  }
}
square3(numbers: 1,2,3,4,5,6,7,8,9)



/*
 Writing throwing functions
 https://www.hackingwithswift.com/sixty/5/8/writing-throwing-functions
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


/*
 Running throwing functions
 https://www.hackingwithswift.com/sixty/5/9/running-throwing-functions
 
 */
do {
  try checkPassword("password")
  print("That password is good!")
} catch {
  print("You can't use that password.")
}



/*
 inout parameters
 https://www.hackingwithswift.com/sixty/5/10/inout-parameters
 
 Broadly speaking, it’s best to avoid creating inout parameters until you feel confident they are definitely the right choice. When you’re learning (and actually when you’re very experienced too!) it’s usually better to send in some data to a function and get new data back, because it makes it easier to follow your program’s logic.
 
 That doesn’t mean inout isn’t worth knowing, only that you want to be really sure you need it before you begin.
 */
func doubleInPlace(number: inout Int) {
  number *= 2
}
var number = 3
doubleInPlace(number: &number)


/*
 Functions summary
 https://www.hackingwithswift.com/sixty/5/11/functions-summary
 
 01) Functions let us re-use code without repeating ourselves.
 02) Functions can accept parameters – just tell Swift the type of each parameter.
 03) Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
 04) You can use different names for parameters externally and internally, or omit the external name entirely.
 05) Parameters can have default values, which helps you write less code when specific values are common.
 06) Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
 07) Functions can throw errors, but you must call them using try and handle errors using catch.
 08) You can use inout to change variables inside a function, but it’s usually better to return a new value.
 */
