import Foundation

// MARK: - Normal enumeration -
enum Location {
  case address(String)
  case coordinate(Double, Double)
}

let location1 = Location.address("123 main st")
let location2 = Location.coordinate(12.34523, 34.45235)

// MARK: - Structures -
struct Address {
  var streetNumber: Int
  var streetName: String
  var city: String
  var zipCode: Int
}

struct Coordinate {
  let lat: Double
  let long: Double
}

// MARK: - Generic Enumeration -
enum GenLocation<T> {
  case address(T)
  case coordinate(T)
}

// MARK: - Usage -
let locationWithAddress = GenLocation.address(Address(streetNumber: 123,
                                                      streetName: "main str",
                                                      city: "New Zeland",
                                                      zipCode: 123445))
print(locationWithAddress)


let locationWithCoordinate = GenLocation.coordinate(Coordinate(lat: 12.12344, long: 45.43255))
print(locationWithCoordinate)

