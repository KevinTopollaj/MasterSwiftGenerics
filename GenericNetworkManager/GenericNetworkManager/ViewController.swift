//
//  ViewController.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 18.4.21.
//

import UIKit

class ViewController: UIViewController {
  
  var people = [Person]()
  
  private lazy var tableView: RegularTableView = {
    let tableView = RegularTableView(items: people.map { $0.name }) { (name, cell) in
      cell.textLabel?.text = name
    } selectionHandler: { selectedName in
      print(selectedName)
    }
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getPeople()
    addSubviewAndConstraints()
  }
  
  fileprivate func getPeople() {
    GenericNetworkManager<SWAPIEnvelope>().fetch(url: URL(string: "https://swapi.dev/api/people/?search=sky")!) { (result) in
      switch result {
      case .success(let swapi):
        print(swapi)
        self.getFilm(for: swapi.results[0])
        self.people = swapi.results
        self.tableView.reload(data: self.people.map { $0.name })
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

  fileprivate func addSubviewAndConstraints() {
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

}

