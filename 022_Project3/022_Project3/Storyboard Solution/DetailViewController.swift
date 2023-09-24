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
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
    guard let imageInfo = imageInfo else { return }
    title = "Picture \(imageInfo.position) of \(imageInfo.total)"
    imageView.image = UIImage(named: imageInfo.path)
  }
  
  @objc func shareTapped() {
    guard
      let name = imageInfo?.path,
      let image = imageView.image?.jpegData(compressionQuality: 0.8)
    else {
      print("No image found :/")
      return
    }
    
    let vc = UIActivityViewController(activityItems: [image, "That's the \(name) image!"], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
}
