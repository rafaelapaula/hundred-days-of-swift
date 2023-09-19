//
//  DetailViewController.swift
//  016_to_018_Project1
//
//  Created by rafaela.lourenco on 19/09/23.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  var selectedImage: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = selectedImage
    navigationItem.largeTitleDisplayMode = .never
    
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
  }
}
