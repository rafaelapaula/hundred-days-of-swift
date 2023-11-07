import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
  lazy var personImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
    imageView.layer.borderWidth = 1.0
    imageView.layer.cornerRadius = 3.0
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16.0, weight: .bold)
    label.textAlignment = .left
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
    
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addViews()
    addConstraints()
    backgroundColor = .white
    
    layer.cornerRadius = 3.0
  }
  
  func addViews() {
    containerStackView.addArrangedSubview(personImageView)
    containerStackView.addArrangedSubview(nameLabel)
    addSubview(containerStackView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
      containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
      containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
      containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
      containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)
    ])
  }
  
  func configure(with person: Person) {
    nameLabel.text = person.name
    
    let path = getDocumentsDirectory().appendingPathComponent(person.image)
    personImageView.image = UIImage(contentsOfFile: path.path)
  }
  
  override class func description() -> String {
    "PersonCollectionViewCell"
  }
}
