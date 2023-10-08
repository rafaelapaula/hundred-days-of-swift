//
//  ViewController.swift
//  023_Challenge
//
//  Created by rafaela.lourenco on 25/09/23.
//

import UIKit

class ViewController: UITableViewController {

  var flags = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Flags"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    flags += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
  }


  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return flags.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = flags[indexPath.row].uppercased()
    cell.imageView?.image = UIImage(named: "Flag\(flags[indexPath.row])")
    
    return cell
            
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
    vc.flagInfo = (path: flags[indexPath.row], name: flags[indexPath.row].uppercased())
    navigationController?.pushViewController(vc, animated: true)
  }
}

