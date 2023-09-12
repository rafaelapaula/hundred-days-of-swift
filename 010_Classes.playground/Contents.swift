import UIKit

/*
 MARK: Classes
 https://www.hackingwithswift.com/100/10
 */

/*
 Why does Swift have both classes and structs?
 
 Classes and structs give Swift developers the ability to create custom, complex types with properties and methods, but they have five important differences:
 
 * Classes do not come with synthesized memberwise initializers.
 * One class can be built upon (“inherit from”) another class, gaining its properties and methods.
 * Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
 * Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
 * Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.
 
 I’ll explain these differences in more detail soon, but the point is that they exist and that they matter. Most Swift developers prefer to use structs rather than classes when possible, which means when you choose a class over a struct you’re doing so because you want one of the above behaviors.
 */
/*
 Creating your own classes
 https://www.hackingwithswift.com/sixty/8/1/creating-your-own-classes
 */
class Dog {
  var name: String
  var breed: String
  
  // In classes, if we have parameter to be filled, we must create an initializer
  init(name: String, breed: String) {
    self.name = name
    self.breed = breed
  }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")


/*
 Class inheritance
 https://www.hackingwithswift.com/sixty/8/2/class-inheritance
 */
class Poddle: Dog {
  init(name: String) {
    // For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.
    super.init(name: name, breed: "Poddle")
  }
}


/*
 Overriding methods
 https://www.hackingwithswift.com/sixty/8/3/overriding-methods
 */
class Dog2 {
  func makeNoise() {
    print("au,au!")
  }
}

class Poddle2: Dog2 {
  override func makeNoise() {
    print("Yip!")
  }
}

let poppy2 = Poddle2()
poppy2.makeNoise()


/*
 Final classes
 https://www.hackingwithswift.com/sixty/8/4/final-classes
 
 Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.
 
 In Swift it used to be the case that final classes were more performant than non-final classes, because we were providing a little bit more information about how our code would run and Swift would use that to make some optimizations.
 
 That hasn’t been true for a while, but even today I think many people instinctively declare their classes as final to mean “you shouldn’t subclass from this unless I specifically allow it.” I certainly do this a lot, because it’s another way I can help folks understand how my code works.
 */
final class Dog3 {
  var name: String
  var breed: String
  
  init(name: String, breed: String) {
    self.name = name
    self.breed = breed
  }
}


/*
 Copying objects
 https://www.hackingwithswift.com/sixty/8/5/copying-objects
 
 The technical term for this distinction is “value types vs reference types.” Structs are value types, which means they hold simple values such as the number 5 or the string “hello”. It doesn’t matter how many properties or methods your struct has, it’s still considered one simple value like a number. On the other hand, classes are reference types, which means they refer to a value somewhere else.
 */
class Singer {
  var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singerCopy.name)
print(singer.name)



/*
 Deinitializers
 https://www.hackingwithswift.com/sixty/8/6/deinitializers
 
 So, the simple reason for why structs don’t have deinitializers is because they don’t need them: each struct has its own copy of its data, so nothing special needs to happen when it is destroyed.
 */
class Person {
  var name = "John Doe"
  
  init() {
    print("\(name) is alive!")
  }
  
  func printGreeting() {
    print("Hello, I'm \(name)")
  }
  
  deinit {
    print("\(name) is no more!")
  }
}

for _ in 1...3 {
  let person = Person()
  person.printGreeting()
}


/*
 Mutability
 https://www.hackingwithswift.com/sixty/8/7/mutability
 
 The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.
 
 However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.
 */
class Singer2 {
  let name = "Taylor Swift" // with let we can't change it!
}

/*
 One of the small but important differences between structs and classes is the way they handle mutability of properties:
 
 * Variable classes can have variable properties changed
 * Constant classes can have variable properties changed
 * Variable structs can have variable properties changed
 * Constant structs cannot have variable properties changed
 
 So, if changing one part of a struct effectively means destroying and recreating the entire struct, hopefully you can see why constant structs don’t allow their variable properties to be changed – it would mean destroying and recreating something that is supposed to be constant, which isn’t possible.
 
 Classes don’t work this way: you can change any part of their properties without having to destroy and recreate the value. As a result, constant classes can have their variable properties changed freely.
 */



/*
 Classes summary
 https://www.hackingwithswift.com/sixty/8/8/classes-summary
 
 You’ve made it to the end of the eighth part of this series, so let’s summarize:
 
 01) Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 02) One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
 03) You can mark a class with the final keyword, which stops other classes from inheriting from it.
 04) Method overriding lets a child class replace a method in its parent class with a new implementation.
 05) When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 06) Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 07) Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
 */
