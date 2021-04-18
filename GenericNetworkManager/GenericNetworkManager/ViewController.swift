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
    
    GenericNetworkManager<SWAPIEnvelope>().fetch(url: URL(string: "https://swapi.dev/api/people/?search=sky")!) { (result) in
      switch result {
      case .success(let swapi):
        print(swapi)
        self.getFilm(for: swapi.results[0])
        
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func getFilm(for person: Person?) {
    guard let person = person else { return }
    GenericNetworkManager<Film>().fetch(url: URL(string: person.films[0])!) { (result) in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let film):
        print(film)
      }
    }
  }


}

