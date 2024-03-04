import Foundation

/*
 When we were working on this code in project 10, there were two outstanding questions:
 
 Why do we need a class here when a struct will do just as well? (And in fact better, because structs come with a default initializer!)
 Why do we need to inherit from NSObject?
 It's time for the answers to become clear. You see, working with NSCoding requires you to use objects, or, in the case of strings, arrays and dictionaries, structs that are interchangeable with objects. If we made the Person class into a struct, we couldn't use it with NSCoding.
 
 The reason we inherit from NSObject is again because it's required to use NSCoding – although cunningly Swift won't mention that to you, your app will just crash.
 
 Once you conform to the NSCoding protocol, you'll get compiler errors because the protocol requires you to implement two methods: a new initializer and encode().
 **/
class Person: NSObject, NSCoding, NSSecureCoding {
  static var supportsSecureCoding: Bool  = true
  
  var name: String
  var image: String
  
  init(name: String, image: String) {
    self.name = name
    self.image = image
  }
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(image, forKey: "image")
  }
  
  
}
