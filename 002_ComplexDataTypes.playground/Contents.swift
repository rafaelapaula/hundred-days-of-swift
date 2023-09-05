import UIKit

/*
 MARK: Day 02: Complex data types
 https://www.hackingwithswift.com/100/2
 */


/*
 Arrays
 https://www.hackingwithswift.com/sixty/2/1/arrays
 */
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]
let otherBeatlesArray: [String] = [john]
otherBeatlesArray[0]

/*
 Sets
 https://www.hackingwithswift.com/sixty/2/2/sets
 
 Sets are collections of values just like arrays, except they have two differences:
 
 01) Items aren’t stored in any order; they are stored in what is effectively a random order.
 02) No item can appear twice in a set; all items must be unique.
 
 When you say “does this set contain item X,” you’ll get an answer in a split second no matter how big the set is. * That's a good way to optimize your searches *
 */
let colors = Set(["red", "green", "blue"]) // Swift makes no guarantees about its order. Because of it, you can’t read values from a set using numerical positions like you can with arrays.
let colors2 = Set(["red", "green", "blue", "green", "red"]) // If you try to insert a duplicate item into a set, the duplicates get ignored
colors.contains("red")

/*
 Tuples
 https://www.hackingwithswift.com/sixty/2/3/tuples
 
 01) You can’t add or remove items from a tuple; they are fixed in size.
 02) You can’t change the type of items in a tuple; they always have the same types they were created with.
 03) You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
 */
var name = (first: "Taylor", last: "Swift")
name.0
name.first

/*
 Arrays vs sets vs tuples
 https://www.hackingwithswift.com/sixty/2/4/arrays-vs-sets-vs-tuples
 */
let tuple = (house: 555, street: "Taylor Swift Avenue", city: "Nashville") // TUPLES: If you need a specific, fixed collection of related values where each item has a precise position or name
let set = Set(["aardvark", "astronaut", "azalea"]) // SET: If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly
let array = ["Eric", "Graham", "John", "Terry", "Terry"] // ARRAY: If you need a collection of values that can contain duplicates, or the order of your items matters


/*
 Dictionaries
 https://www.hackingwithswift.com/sixty/2/5/dictionaries
 
 When using type annotations, dictionaries are written in brackets with a colon between your identifier and value types. For example, [String: Double] and [String: String]
 
 Dictionaries don’t store our items using an index, but instead they optimize the way they store items for fast retrieval. So, when we say user["country"] it will send back the item at that key (or nil) instantly, even if we have a dictionary with 100,000 items inside.
 */
let heights = [
  "Taylor Swift": 1.78,
  "Ed Sheeran": 1.73
]
heights["Taylor Swift"]


/*
 Dictionary default values
 https://www.hackingwithswift.com/sixty/2/6/dictionary-default-values
 */
let favoriteIceCream = [
  "Paul": "Chocolate",
  "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Rafaela", default: "Unknown"]


/*
 Creating empty collections
 https://www.hackingwithswift.com/sixty/2/7/creating-empty-collections
 
 Swift has special syntax only for dictionaries and arrays;
 Other types must use angle bracket syntax like sets.
 */
var teamsDict = [String: String]()
teamsDict["Rafa"] = "Red"

var resultsArr = [Int]()
resultsArr.append(1)

var words = Set<String>()
var numbers = Set<Int>()
var scores = Dictionary<String, Int>() // we can also use this syntax
var results = Array<Int>()

/*
 Enumerations
 https://www.hackingwithswift.com/sixty/2/8/enumerations
 */
enum Result {
  case success
  case failure
}
var result = Result.failure


/*
 Enum associated values
 https://www.hackingwithswift.com/sixty/2/9/enum-associated-values
 */
enum Activity {
  case bored
  case running(destination: String)
  case talking(topic: String)
  case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")


/*
 Enum raw values
 https://www.hackingwithswift.com/sixty/2/10/enum-raw-values
 */
enum Planet: Int {
  case mercury = 1 //Now Swift will assign 1 to mercury and count upwards from there, meaning that earth is now the third planet.
  case venus
  case earth
  case mars
}

let earth = Planet(rawValue: 3)


/*
 Complex types: Summary
 https://www.hackingwithswift.com/sixty/2/11/complex-types-summary
 
 01) Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 
 02) Arrays store items in the order you add them, and you access them using numerical positions.
 
 03) Sets store items without any order, so you can’t access them using numerical positions.
 
 04) Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 
 05) Dictionaries store items according to a key, and you can read items using those keys.
 
 06) Enums are a way of grouping related values so you can use them without spelling mistakes.
 
 07) You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */
