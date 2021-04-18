//
//  ViewController.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 18.4.21.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    NetworkManager().fetch(url: URL(string: "https://swapi.dev/api/people/?search=sky")!) { result in
      
      switch result {
      case .failure(let error):
        print(error)
      case .success(let data):
        let json = try? JSONDecoder().decode(SWAPIEnvelope.self, from: data)
        print(json ?? "no data")
      }
    }
  }


}

