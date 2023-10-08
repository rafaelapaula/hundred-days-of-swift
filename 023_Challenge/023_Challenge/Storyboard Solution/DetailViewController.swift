//
//  DetailViewController.swift
//  023_Challenge
//
//  Created by rafaela.lourenco on 25/09/23.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var flagInfo: (path: String, name: String)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard
      let path = flagInfo?.path,
      let image = UIImage(named: "Flag\(path)")
    else { return }
    
    imageView.image = image
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
  }
  
  @objc func shareTapped() {
    guard
      let name = flagInfo?.name,
      let image = imageView.image?.jpegData(compressionQuality: 0.8)
    else {
      print("No image found :/")
      return
    }
    
    let vc = UIActivityViewController(activityItems: [image, "That's the \(name) flag!"], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
  
}

