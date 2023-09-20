//
//  DetailViewController.swift
//  016_to_018_Project1
//
//  Created by rafaela.lourenco on 19/09/23.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  var imageInfo: (path: String, position: Int, total: Int)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.largeTitleDisplayMode = .never
    
    guard let imageInfo = imageInfo else { return }
    title = "Picture \(imageInfo.position) of \(imageInfo.total)"
    imageView.image = UIImage(named: imageInfo.path)
  }
}
