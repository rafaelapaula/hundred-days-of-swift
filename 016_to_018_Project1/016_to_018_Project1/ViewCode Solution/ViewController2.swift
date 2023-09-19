//
//  PicturesViewController.swift
//  016_to_018_Project1
//
//  Created by rafaela.lourenco on 18/09/23.
//

import UIKit

class ViewController2: UITableViewController {
  
  var pictures = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Storm Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    self.loadPictures()
  }
  
  func loadPictures() {
    let fileManager = FileManager.default
    
    guard
      let path = Bundle.main.resourcePath,
      let items = try? fileManager.contentsOfDirectory(atPath: path)
    else { return }
    
    pictures = items.filter { $0.hasPrefix("nssl") }
  }
}

extension ViewController2 {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "picture") ??  UITableViewCell(style: .default, reuseIdentifier: "picture")
    cell.textLabel?.text = pictures[indexPath.row]
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = DetailViewController2(path: pictures[indexPath.row])
    navigationController?.pushViewController(viewController, animated: true)
  }
}
