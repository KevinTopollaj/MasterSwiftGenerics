/// A function that will do a linear search in an array to find an element, if the element is found the function will return the index for that item or it will return nil if the item is not found.
/// - Parameters:
///   - array: First Parameter of type [T]
///   - key: Second Parameter of type T
/// - Returns: Index of the element if it is found otherwise nil
public func linearSearch<T: Equatable>(array: [T], key: T) -> Int? {
  for i in 0..<array.count {
    if array[i] == key {
      return i
    }
  }
  return nil
}

let cars = ["Honda", "Tesla", "Ford", "Mercedes"]
let myCar = "Tesla"

guard let index = linearSearch(array: cars, key: myCar) else {
  fatalError("index not found")
}

print(index)
