//
//  FlagsViewCell.swift
//  023_Challenge
//
//  Created by rafaela.lourenco on 08/10/23.
//

import UIKit

class FlagsViewCell: UITableViewCell, ViewCodable {
  lazy var flagImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 5
    imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
    imageView.layer.borderWidth = 1
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var flagNameLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20.0, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 16.0
    stackView.axis = .horizontal
    stackView.clipsToBounds = true
    return stackView
  }()
  
  func setup() {
    backgroundColor = .white
    addViews()
    addConstraints()
  }
  
  func addViews() {
    stackView.addArrangedSubview(flagImageView)
    stackView.addArrangedSubview(flagNameLabel)
    self.addSubview(stackView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      flagImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0)
    ])
  }
  
  func configure(name: String) {
    setup()
    flagNameLabel.text = name
    flagImageView.image = UIImage(named: "Flag\(name)")
  }
}
