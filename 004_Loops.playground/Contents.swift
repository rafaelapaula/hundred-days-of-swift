import UIKit

/*
 MARK: Loops
 https://www.hackingwithswift.com/100/4
 */

/*
 For loops
 https://www.hackingwithswift.com/sixty/4/1/for-loops
 */
let count = 1...10
for number in count {
  print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]
for album in albums {
  print("\(album) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 {
  print("play")
}


/*
 While loops
 https://www.hackingwithswift.com/sixty/4/2/while-loops
 */
var number = 1

while number <= 20 {
  print(number)
  number += 1
}

print("Ready or not, here I come!")


/*
 Repeat loops
 https://www.hackingwithswift.com/sixty/4/3/repeat-loops
 */

number = 1

repeat {
  print(number)
  number += 1
} while number <= 20

print("Ready or not, here I come!")
          
while false {
  print("This is false")
}

repeat {
  print("This is false")
} while false
          

/*
 Exiting loops
 https://www.hackingwithswift.com/sixty/4/4/exiting-loops
 */
var countDown = 10
while countDown >= 0 {
  print(countDown)
  if countDown == 4 {
    print("I'm bored. Let's go now")
    break
  }
  countDown -= 1
}
print("Blast off!")


/*
 Exiting multiple loops
 https://www.hackingwithswift.com/sixty/4/5/exiting-multiple-loops
 */
mySuperLoop: for i in 1...10 {
  for j in 1...10 {
    let product = i * j
    print("\(i) * \(j) is \(product)")
    
    if product == 50 {
      print("It's a bullseye!")
      break mySuperLoop
    }
  }
}


/*
 Skipping items
 https://www.hackingwithswift.com/sixty/4/6/skipping-items
 */
for i in 1...10 {
  if i % 2 == 1 {
    continue
  }
  print(i)
}


/*
 Infinite loops
 https://www.hackingwithswift.com/sixty/4/7/infinite-loops
 */

var counter = 0
while true {
  print("  ")
  counter += 1
  
  if counter == 273 {
    break
  }
}


/*
 Looping summary
 https://www.hackingwithswift.com/sixty/4/8/looping-summary
 
 01) Loops let us repeat code until a condition is false.
 02) The most common loop is for, which assigns each item inside the loop to a temporary constant.
 03) If you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work.
 04) There are while loops, which you provide with an explicit condition to check.
 05) Although they are similar to while loops, repeat loops always run the body of their loop at least once.
 06) You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop.
 07) You can skip items in a loop using continue.
 08) Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops!
 
 */
