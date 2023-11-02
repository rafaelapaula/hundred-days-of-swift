import UIKit

class PeopleViewController: UICollectionViewController {
  
  override func loadView() {
    // create a layout to be used
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    // make sure that there is a slightly larger gap at the top of each row
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    // set a standard item size of 60 * 60
    layout.itemSize = CGSize(width: 50, height: 180)
    // the layout scrolls horizontally
    layout.scrollDirection = .vertical
    // set the frame and layout
    collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    // set the view to be this UICollectionView
    self.view = collectionView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  func configureView() {
    collectionView.backgroundColor = .red
    collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: PersonCollectionViewCell.description())
    view.backgroundColor = .blue
  }
  
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.description(), for: indexPath) as? PersonCollectionViewCell else {
      fatalError("Unable to dequeue PersonCell.")
    }
    cell.configure()
    return cell
  }
}
