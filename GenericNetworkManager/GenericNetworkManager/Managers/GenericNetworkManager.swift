//
//  GenericNetworkManager.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 18.4.21.
//

import Foundation

class GenericNetworkManager<T: Codable> {
  
  func fetch(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
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
      
      do {
        let json = try JSONDecoder().decode(T.self, from: data)
        completion(.success(json))
      } catch {
        print(error)
      }
      
    }.resume()
    
  }
}
