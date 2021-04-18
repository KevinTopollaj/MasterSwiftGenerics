//
//  NetworkManager.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 18.4.21.
//

import Foundation

enum NetworkError: Error {
  case failed(error: Error)
  case invalidResponse(response: URLResponse)
  case emptyData
}

class NetworkManager {
  
  func fetch(url: URL, completion: @escaping (Result<Data,NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      guard error == nil else {
        completion(.failure(.failed(error: error!)))
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
        completion(.failure(.invalidResponse(response: response!)))
        return
      }
      
      guard let data = data else {
        completion(.failure(.emptyData))
        return
      }
      
      completion(.success(data))
    }.resume()
    
  }
}
