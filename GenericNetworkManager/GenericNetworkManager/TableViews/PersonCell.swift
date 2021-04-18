//
//  PersonCell.swift
//  GenericNetworkManager
//
//  Created by Kevin Topollaj on 19.4.21.
//

import UIKit

final class PersonCell: UITableViewCell {
  
  var person: Person? {
    didSet {
      if let person = person {
        nameLabel.text = person.name
        genderLabel.text = person.gender
      }
    }
  }
  
  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkGray
    label.font = label.font.withSize(16)
    return label
  }()
  
  private lazy var genderLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .secondaryLabel
    label.font = label.font.withSize(14)
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    contentView.addSubview(nameLabel)
    contentView.addSubview(genderLabel)
    setupConstraints()
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      
      genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
      genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      genderLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
}
