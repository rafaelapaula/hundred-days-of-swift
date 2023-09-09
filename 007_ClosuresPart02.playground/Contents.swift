import UIKit

/*
 MARK: Closures, part two
 https://www.hackingwithswift.com/100/7
 */


/*
 Using closures as parameters when they accept parameters
 https://www.hackingwithswift.com/sixty/6/6/using-closures-as-parameters-when-they-accept-parameters
 */
func travel(action: (String) -> Void) {
  print("I'm getting ready to go")
  action("London")
  print("I arrived!")
}

travel { (place: String) in
  print("\(place) is the place that I'm going to")
}
travel { place in
  print("I'm going to \(place) in my car")
}


/*
 Using closures as parameters when they return values
 https://www.hackingwithswift.com/sixty/6/7/using-closures-as-parameters-when-they-return-values
 */
func travel2(action: (String) -> String) {
  print("I'm getting ready to go.")
  let description = action("London")
  print(description)
  print("I arrived!")
}
travel2 { (place: String) in
  return "I'm going to \(place) in my car"
}

func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
  // start with a total equal to the first value
  var current = values[0]
  
  // loop over all the values in the array, counting from index 1 onwards
  for value in values[1...] {
    // call our closure with the current value and the array element, assigning its result to our current value
    current = closure(current, value)
  }
  
  // send back the final current value
  return current
}

let numbers = [10, 20, 30]

var sum = reduce(numbers) { (runningTotal: Int, next: Int) in
  runningTotal + next
}

print(sum)
sum = reduce(numbers, using: +)


/*
 Shorthand parameter names
 https://www.hackingwithswift.com/sixty/6/8/shorthand-parameter-names
 */
func travel3(action: (String) -> String) {
  print("I'm getting ready to go.")
  let description = action("London")
  print(description)
  print("I arrived!")
}

travel3 { (place: String) -> String in
  return "I'm going to \(place) in my car"
}

travel3 { place -> String in
  return "I'm going to \(place) in my car"
}

travel3 { place in
  return "I'm going to \(place) in my car"
}

travel3 { place in
  "I'm going to \(place) in my car"
}

travel3 { "I'm going to \($0) in my car" }



/*
 Closures with multiple parameters
 https://www.hackingwithswift.com/sixty/6/9/closures-with-multiple-parameters
 */
func travel4(action: (String, Int) -> String) {
  print("I'm getting ready to go.")
  let description = action("London", 60)
  print(description)
  print("I arrived!")
}
travel4 {
  "I'm going to \($0) at \($1) miles per hour."
}


/*
 Returning closures from functions
 https://www.hackingwithswift.com/sixty/6/10/returning-closures-from-functions
 */
func travel5() -> (String) -> Void {
  return {
    print("I'm going to \($0)")
  }
}
let result2 = travel5()
result2("London")

travel5()("London")


/*
 Capturing values
 https://www.hackingwithswift.com/sixty/6/11/capturing-values
 */
func travel6() -> (String) -> Void {
  var counter = 1
  
  return {
    print("\(counter). I'm going to \($0)")
    counter += 1
  }
}

let result6 = travel6()
result6("London")
result6("London")
result6("London")
result6("London")


/*
 Closures summary
 https://www.hackingwithswift.com/sixty/6/12/closures-summary
 
 01) You can assign closures to variables, then call them later on.
 02) Closures can accept parameters and return values, like regular functions.
 03) You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
 04) If the last parameter to your function is a closure, you can use trailing closure syntax.
 05) Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
 06) If you use external values inside your closures, they will be captured so the closure can refer to them later.
 */
