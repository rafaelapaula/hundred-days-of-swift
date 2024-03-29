//
//  ViewController.swift
//  016_to_018_Project1
//
//  Created by rafaela.lourenco on 18/09/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var pictures = [String]()
  let localStorage = LocalStorage()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Storm Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    loadImages()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
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
    pictures.sort()
  }
  
  @objc func shareTapped() {
    let vc = UIActivityViewController(activityItems: ["This is my first app of 100 days of swift!"], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
}

// MARK: UITableView methods

extension ViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    let counter = localStorage.views(for: pictures[indexPath.row])
    cell.textLabel?.text = "\(pictures[indexPath.row]) (\(counter))"
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.imageInfo = (path: pictures[indexPath.row], position: (indexPath.row + 1), total: pictures.count)
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
