//
//  GenericTableView.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 18.4.21.
//

import UIKit

final class GenericTableView<Item, Cell: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource {
  private var items: [Item]
  private var config: (Item, Cell) -> Void
  private var selectionHandler: (Item) -> Void
  
  private let reuseID = "Cell"
  
  init(items: [Item], config: @escaping (Item, Cell) -> Void, selectionHandler: @escaping (Item) -> Void) {
    self.items = items
    self.config = config
    self.selectionHandler = selectionHandler
    
    super.init(frame: .zero, style: .plain)
    self.delegate = self
    self.dataSource = self
    
    self.register(Cell.self, forCellReuseIdentifier: reuseID)
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! Cell
    config(items[indexPath.row], cell)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    selectionHandler(items[indexPath.row])
  }
}


extension GenericTableView {
  func reload(data items: [Item]) {
    self.items = items
    DispatchQueue.main.async {
      self.reloadData()
    }
  }
}
