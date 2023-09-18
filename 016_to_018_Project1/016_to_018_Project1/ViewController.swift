//
//  ViewController.swift
//  016_to_018_Project1
//
//  Created by rafaela.lourenco on 18/09/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var pictures = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    loadImages()
  }


  func loadImages() {
    let fm = FileManager.default
    guard
      let path = Bundle.main.resourcePath,
      let items = try? fm.contentsOfDirectory(atPath: path)
    else { return }
    
    for item in items {
      guard item.hasPrefix("nssl") else { continue }
      pictures.append(item)
    }
    
    print(pictures)
  }
}

// MARK: UITableViewDataSource

extension ViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    cell.textLabel?.text = pictures[indexPath.row]
    return cell
  }
}
