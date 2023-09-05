import UIKit

/*
 MARK: Operators and conditions
 https://www.hackingwithswift.com/100/3
 */

/*
 Arithmetic operators
 https://www.hackingwithswift.com/sixty/3/1/arithmetic-operators
 */
let firstScore = 12
let secondScore = 4

let sum = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore

/*
 Operator overloading
 https://www.hackingwithswift.com/sixty/3/2/operator-overloading
 */
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let seconfHalf = ["George", "Ringo"]
let beatles = firstHalf + seconfHalf


/*
 Compound assignment operators
 https://www.hackingwithswift.com/sixty/3/3/compound-assignment-operators
 */
var score = 95
score += 5

var quote = "The rain in Spain falls mainly on the "
quote += " Spaniards"


/*
 Comparison Operators
 https://www.hackingwithswift.com/sixty/3/4/comparison-operators
 */

firstScore == secondScore
firstScore != secondScore

firstScore < secondScore
firstScore >= secondScore

"Taylor" <= "Swift"


/*
 Conditions
 https://www.hackingwithswift.com/sixty/3/5/conditions
 */
let firstCard = 11
let secondCard = 10

if firstCard + secondScore == 2 {
  print("Aces - lucky!")
} else if firstCard + secondCard == 21 {
  print("Blackjack!")
} else {
  print("Regular cards")
}


/*
 Combining conditions
 https://www.hackingwithswift.com/sixty/3/6/combining-conditions
 */
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
  print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
  print("At least one is over 18")
}


/*
 The ternary operator
 https://www.hackingwithswift.com/sixty/3/7/the-ternary-operator
 */
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

if firstCard == secondCard {
  print("Cards are the same")
} else {
  print("Cards are different")
}


/*
 Switch statements
 https://www.hackingwithswift.com/sixty/3/8/switch-statements
 */
let weather = "sunny"

switch weather {
  case "rain":
    print("Bring an umbrella")
  case "snow":
    print("Wrap up warm")
  case "sunny":
    print("Wear sunscreen")
    fallthrough // If you want execution to continue on to the next case, use the fallthrough keyword
  default:
    print("Enjoy your day!")
}


/*
 Range operators
 https://www.hackingwithswift.com/sixty/3/9/range-operators
 */
let testScore = 85

switch testScore {
  case 0..<50:
    print("You failed badly!")
  case 50..<85:
    print("You did OK")
  default:
    print("You did great!")
}

let names = ["Pipes", "Alex", "Suzanne", "Gloria"]
print(names[0])
print(names[1...3])
print(names[1...])


/*
 Operators and conditions summary
 https://www.hackingwithswift.com/sixty/3/10/operators-and-conditions-summary
 
 01) Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 02) There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 03) You can use if, else, and else if to run code based on the result of a condition.
 04) Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
 05) If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 06) You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
 */
