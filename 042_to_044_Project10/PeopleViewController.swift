import UIKit

class PeopleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {
  
  var people = [Person]()
  
  convenience init() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    layout.itemSize = CGSize(width: 100, height: 180)
    layout.scrollDirection = .vertical
    self.init(collectionViewLayout: layout)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    configureNavigationBar()
  }
  
  func configureNavigationBar() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
  }
  
  func configureView() {
    collectionView.backgroundColor = .red
    collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: PersonCollectionViewCell.description())
    view.backgroundColor = .white
    collectionView.backgroundColor = .lightGray.withAlphaComponent(0.2)
  }
  
  @objc func addNewPerson() {
    let picker = UIImagePickerController()
    picker.allowsEditing = true
    picker.delegate = self
    present(picker, animated: true)
  }
}

extension PeopleViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return people.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.description(), for: indexPath) as? PersonCollectionViewCell else {
      fatalError("Unable to dequeue PersonCell.")
    }
    let person = people[indexPath.item]
    cell.configure(with: person)
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let person = people[indexPath.item]
    
    let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
    ac.addTextField()
    
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
      guard let newName = ac?.textFields?[0].text else { return }
      person.name = newName
      
      self?.collectionView.reloadData()
    })
    
    present(ac, animated: true)
  }
}

extension PeopleViewController: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let image = info[.editedImage] as? UIImage else { return }
    
    let imageName = UUID().uuidString
    let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
    
    if let jpegData = image.jpegData(compressionQuality: 0.8) {
      try? jpegData.write(to: imagePath)
    }
    
    let person = Person(name: "Unknown", image: imageName)
    people.append(person)
    collectionView.reloadData()
    
    dismiss(animated: true)
  }
  

}
