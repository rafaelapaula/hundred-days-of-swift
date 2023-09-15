import UIKit

/*
 Swift review, day one
 https://www.hackingwithswift.com/100/13
 */

/*
 Variables and constants
 https://www.hackingwithswift.com/read/0/2/variables-and-constants
 
 One of the advantages of separating constants and variables is that Xcode will tell us if we’ve made a mistake. If we say, "make this date a constant, because I know it will never change" then 10 lines later try to change it, Xcode will refuse to build our app.
 */
var name = "Tim McGraw"
name = "Romeo"
let name1 = "My constant"
// name1 = ""  -  Cannot assign to value: 'name1' is a 'let' constant


/*
 Types of Data
 https://www.hackingwithswift.com/read/0/3/types-of-data
 */
var name2 = "Tim McGraw" // The compiler knows that is a string (by type inference)
var name3: String // The compiler knows that is a string (by the type annotaion)

// Note: some people like to put a space before and after the colon, making var name : String, but they are wrong and you should try to avoid mentioning their wrongness in polite company.

var latitude: Double // Double has more accuracy than Float, but it also has limitations
latitude = 36.166667

var longitude: Float
longitude = -1286.166667


/*
 Operators
 https://www.hackingwithswift.com/read/0/4/operators
 */
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var c = 1.1; var d = 2.2
var e = c + d

c > 3
c >= 3
c > 4
c < 4

var name4 = "Rafa"; var name5 = "Anna"
var name6 = name4 + " and " + name5

var name7 = "Tim McGraw"
name7 == "Tim McGraw"
name7 != "Tim McGraw"

var stayOutTooLate = true
stayOutTooLate
!stayOutTooLate


/*
 String Interpolation
 https://www.hackingwithswift.com/read/0/5/string-interpolation
 */
var name8 = "Tim McGraw"
var age = 25
print("Your name is \(name8)")
print("Your name is " + name8)
print("Your name is \(name8), your age is \(age) and your latitude is \(latitude)")
print("You are \(age) years old. In another \(age) years you will be \(age * 2)."
)


/*
 Arrays
 https://www.hackingwithswift.com/read/0/6/arrays
 */
var evenNumbers = [2, 4, 6, 8]
var songs: [Any] = ["Shake it Off", "Chico", "Pluie", 2] // Heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional

songs[0]
songs[1]
songs[2]
songs[3]

type(of: songs)

var songs2: [String] = []
var songs3 = [String]()
var both = Array<String>()

songs2 = ["Shake it Off", "You Belong with Me", "Love Story"]
songs3 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
both = songs2 + songs3
both += ["Everything has Changed"]


/*
 Dictionaries
 https://www.hackingwithswift.com/read/0/7/dictionaries
 */
var person = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
person[1] // last name
person[3] // born month

var person2 = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
              ]
person2["middle"]
person2["month"]

// As you can see, when you make a dictionary you write its key, then a colon, then its value. You can then read any value from the dictionary just by knowing its key, which is much easier to work with.

// As with arrays, you can store a wide variety of values inside dictionaries, although the keys are most commonly strings.


/*
 Conditional statements
 https://www.hackingwithswift.com/read/0/8/conditional-statements
 */
var action: String
var person3 = "hater"

if person3 == "hater" {
  action = "hate"
} else if person3 == "player" {
  action = "play"
} else {
  action = "cruise"
}

var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
  action = "cruise"
}

if !stayOutTooLate && !nothingInBrain {
  action = "cruise"
}


/*
 Loops
 https://www.hackingwithswift.com/read/0/9/loops
 */

print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

for i in 1...10 {
  print("for loop: \(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
  str += " fake"
}
print(str)

for song in songs {
  print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
  print("\(people[i]) gonna \(actions[i])")
}

for i in 0..<people.count {
  var str = "\(people[i]) gonna"
  
  for i in 0..<actions.count {
    str += " \(actions[i])"
  }
  
  print(str)
}

var counter = 0

while true {
  print("Counter is now \(counter)")
  counter += 1
  
  if counter == 556 {
    break
  }
}

for song in songs2 {
  if song == "You Belong with Me" {
    continue
  }
  
  print("My favorite song is \(song)")
}


/*
 Switch case
 https://www.hackingwithswift.com/read/0/10/switch-case
 
 One thing you should know is that switch/case blocks in Swift don't fall through like they do in some other languages you might have seen. If you're used to writing break in your case blocks, you should know this isn't needed in Swift.
 */
let liveAlbums = 2

switch liveAlbums {
  case 0...1:
    print("You're just starting out")
    
  case 2...3:
    print("You just released iTunes Live From SoHo")
    
  case 4...5:
    print("You just released Speak Now World Tour")
    
  default:
    print("Have you done something new?")
}
