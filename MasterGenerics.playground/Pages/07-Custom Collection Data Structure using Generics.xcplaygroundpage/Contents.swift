import Foundation

struct Stack<T> {
  private var items = [T]()

  /// Adds an item on top of the stack
  /// - Parameter item: item that will be added to the stack
  mutating func put(item: T) {
    items.insert(item, at: 0)
  }
  
  /// Removes the last item added to the stack if there is an item
  /// - Returns: the removed item from the stack otherwise nil
  mutating func pop() -> T? {
    return items.count > 0 ? items.removeFirst() : nil
  }
  
  /// When you dont want to remove your item at the top, you pick it up, take a look at the item an put it back on the stack
  /// - Returns: the top most item of the stack otherwise nil
  func peek() -> T? {
    return items.first
  }
}

// MARK: - Usage -
var stack = Stack<String>()
stack.put(item: "Hello")
stack.put(item: "Hi")
stack.put(item: "Greating")

stack.peek()

var item = stack.pop()

while item != nil {
  print(item ?? "")
  item = stack.pop()
}
