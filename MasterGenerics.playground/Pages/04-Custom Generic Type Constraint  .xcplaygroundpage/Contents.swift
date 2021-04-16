import Foundation

protocol Addable {
  static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable {}
extension Double: Addable {}

func customAdd<T: Addable>(a: T, b: T) -> T {
  return a + b
}

let addInt = customAdd(a: 4, b: 6)
print(addInt)

let addDouble = customAdd(a: 3.5, b: 9.5)
print(addDouble)

