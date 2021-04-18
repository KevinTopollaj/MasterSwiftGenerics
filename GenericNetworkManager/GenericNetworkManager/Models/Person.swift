//
//  Person.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 18.4.21.
//

import Foundation

struct Person: Codable {
  let name: String
  let gender: String
  let homeworld: String
  let films: [String]
}
