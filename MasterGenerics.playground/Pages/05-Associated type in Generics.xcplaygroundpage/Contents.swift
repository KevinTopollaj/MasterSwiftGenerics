import Foundation

// MARK: - Structures -
struct Book {
  var title: String
  var author: String
}

struct VideoGame {
  var title: String
  var publisher: String
}

struct Toy {
  var name: String
}

// MARK: - Protocol with associatedtype -
protocol Storage {
  associatedtype Item
  func store(item: Item)
  func retrieve(index: Int) -> Item
}

// MARK: - Generic class -
class Box<T>: Storage {
  
  var items = [T]()
  
  func store(item: T) {
    items.append(item)
  }
  
  func retrieve(index: Int) -> T {
    return items[index]
  }
  
}

// MARK: - Subclass Generic class -
class GiftBox<T>: Box<T> {
  func wrap(item: T) -> String {
    return "Gift wrap: \(item)"
  }
}

// MARK: - Usage -
let bookBox = Box<Book>()
bookBox.store(item: Book(title: "Swift", author: "DEV"))
bookBox.store(item: Book(title: "SwiftUI", author: "DEV2"))

let bookByIndex = bookBox.retrieve(index: 0)
print(bookByIndex)


let videoGameBox = Box<VideoGame>()
videoGameBox.store(item: VideoGame(title: "Nija", publisher: "EA"))
videoGameBox.store(item: VideoGame(title: "Nija3", publisher: "EA"))

let videoGameByIndex = videoGameBox.retrieve(index: 1)
print(videoGameByIndex)


let toy = Toy(name: "Batman")
let giftBox = GiftBox<Toy>()

giftBox.store(item: toy)
giftBox.wrap(item: toy)
giftBox.retrieve(index: 0)


