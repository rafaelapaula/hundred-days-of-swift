import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
  lazy var personImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16.0, weight: .bold)
    label.text = "Person"
    return label
  }()
  
  lazy var containerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8.0
    return stackView
  }()
  
  convenience init() {
    self.init()
    addViews()
    addConstraints()
    backgroundColor = .lightGray
  }
  
  func addViews() {
    containerStackView.addArrangedSubview(personImageView)
    containerStackView.addArrangedSubview(nameLabel)
    addSubview(containerStackView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
      containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8.0),
      containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
      containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8.0)
    ])
  }
  
  func configure() {
    
  }
  
  override class func description() -> String {
    "PersonCollectionViewCell"
  }
}
