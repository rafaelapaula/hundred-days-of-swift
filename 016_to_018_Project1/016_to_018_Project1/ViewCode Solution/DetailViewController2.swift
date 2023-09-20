//
//  DetailViewController2.swift
//  016_to_018_Project1
//
//  Created by rafaela.lourenco on 19/09/23.
//

import UIKit

class DetailViewController2: UIViewController {
  var imageInfo: (path: String, position: Int, total: Int)?
  
  lazy var imageView = {
    var imageView = UIImageView()
    imageView.image = UIImage(named: imageInfo?.path ?? "")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true // Different Xcode versions create image views slightly differently. If you want to use Aspect Fill for your image, make sure Clip To Bounds is checked to avoid the image overspilling.
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  init(imageInfo: (path: String, position: Int, total: Int)) {
    self.imageInfo = imageInfo
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
    setup()
    
    guard let imageInfo = imageInfo else { return }
    title = "Picture \(imageInfo.position) of \(imageInfo.total)"
  }
}

extension DetailViewController2: ViewCodable {
  func addViews() {
    view.addSubview(imageView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
      imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
  }
}
