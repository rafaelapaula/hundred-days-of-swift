import UIKit
/*
  MARK: Day 01: First steps in Swift
  https://www.hackingwithswift.com/100/1
 */


/*
 Variables
 https://www.hackingwithswift.com/review/variables
 */
var greeting = "Hello, playground"
greeting = "Goodbye!"


/*
 Strings and integers
 https://www.hackingwithswift.com/sixty/1/2/strings-and-integers
 */
var name = "Anna"
var age = 38
var population = 8_000_000

/*
 Multi-line strings
 https://www.hackingwithswift.com/sixty/1/3/multi-line-strings
 */
var multLine1 = """
That's my
multi-line
string
"""

var multLine2 = """
That's my other \
multi-line \
string
"""

/*
 Doubles and booleans
 https://www.hackingwithswift.com/sixty/1/4/doubles-and-booleans
 */
var pi = 3.141
var awesome = true
var myInt = 1
var myDouble = 1.0

/*
 String interpolation
 https://www.hackingwithswift.com/sixty/1/5/string-interpolation
 */
var score = 85
var messageScore = "Your score is \(score)"

/*
 Constants
 https://www.hackingwithswift.com/sixty/1/6/constants
 */
let taylor = "swift"

/*
 Type annotations
 https://www.hackingwithswift.com/sixty/1/7/type-annotations
 
 When should I use type annotations in Swift?
 - Swift can’t figure out what type should be used.
 - You want Swift to use a different type from its default. `var percentage: Double = 99`
 - You don’t want to assign a value just yet. `var name: String`
 */
let typeInferenceStr = "Hey!"
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let madaRocks: Bool = true

/*
 Simple types: Summary
 https://www.hackingwithswift.com/sixty/1/8/simple-types-summary
 
 01) You make variables using var and constants using let. It’s preferable to use constants as often as possible.
 02) Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
 03) Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
 04) String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
 05) Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you want.
 */


