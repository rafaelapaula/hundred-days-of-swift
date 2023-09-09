import UIKit

/*
 MARK: Day 6: Closures Part 01
 https://www.hackingwithswift.com/100/6
 */

/*
 Creating basic closures
 https://www.hackingwithswift.com/sixty/6/1/creating-basic-closures
 */
let driving = {
  print("I'm driving in my car")
}

driving()


/*
 Accepting parameters in a closure
 https://www.hackingwithswift.com/sixty/6/2/accepting-parameters-in-a-closure
 */
let driving2 = { (place: String) in
  print("I'm going to \(place) in my car")
}

driving2("London")


/*
 Returning values from a closure
 https://www.hackingwithswift.com/sixty/6/3/returning-values-from-a-closure
 */
let drivingWithAReturn = { (place: String) -> String in
  return "I'm going to \(place) in my car"
}
let message = drivingWithAReturn("Santa Rita do Sapucaí")
print(message)

let payment = { () -> Bool in
  print("Paying an anonymous person…")
  return true
}

payment()



/*
 Closures as parameters
 https://www.hackingwithswift.com/sixty/6/4/closures-as-parameters
 */
func travel(action: () -> Void) {
  print("I'm getting ready to go...")
  action()
  print("I arrived!")
}
travel(action: driving)


/*
 Trailing closure syntax
 https://www.hackingwithswift.com/sixty/6/5/trailing-closure-syntax
 */
travel() {
  print("I'm driving in my car")
}

travel {
  print("I'm driving in my car")
}
