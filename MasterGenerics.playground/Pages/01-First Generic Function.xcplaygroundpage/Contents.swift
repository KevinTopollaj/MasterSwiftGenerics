import Foundation


/// A generic function that takes a type T that conforms to the Numeric protocol.
/// - Parameters:
///   - a: First Parameter of type T.
///   - b: Second Parameter of type T.
/// - Returns: The sum of First and Second Param that is of type T
func genericAdd<T: Numeric>(a: T, b: T) -> T {
  return a + b
}

genericAdd(a: 1, b: 3)
genericAdd(a: 3.5, b: 5.5)
