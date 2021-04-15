import Foundation

struct Person: Equatable {
  let name: String
  let age: Int
  
  static func ==(lhs: Person, rhs: Person) -> Bool {
    if lhs.name == rhs.name && lhs.age == rhs.age {
      return true
    }
    return false
  }
}

let jim = Person(name: "Jim", age: 24)
let jim2 = Person(name: "Jim", age: 24)
let bob = Person(name: "Bob", age: 34)

print(jim == jim2)
print(jim == bob)

public func linearSearch<T: Equatable>(array: [T], key: T) -> Int? {
  for i in 0..<array.count {
    if array[i] == key {
      return i
    }
  }
  return nil
}

let people = [jim, jim2, bob]
if let bobIndex = linearSearch(array: people, key: bob) {
  print(bobIndex)
  print(people[bobIndex].name)
  print(people[bobIndex].age)
}





