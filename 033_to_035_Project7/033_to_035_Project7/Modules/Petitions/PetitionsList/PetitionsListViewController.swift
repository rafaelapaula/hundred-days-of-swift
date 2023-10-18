//
//  ViewController.swift
//  033_to_035_Project7
//
//  Created by rafaela.lourenco on 17/10/23.
//

import UIKit

class PetitionsListViewController: UITableViewController {
  
  var viewModel: PetitionsListViewModelProtocol?
  
  convenience init(url: URL) {
    self.init()
    viewModel = PetitionsListViewModel(delegate: self, url: url)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerViewCell()
    viewModel?.load()
  }
}

extension PetitionsListViewController: PetitionsDelegate {
  func shouldReloadList() {
    tableView.reloadData()
  }
  
  func didGetAnError(message: String) {
    print("[ERROR] \(message)")
  }
}

extension PetitionsListViewController {
  
  func registerViewCell() {
    tableView.register(PetitionViewCell.self, forCellReuseIdentifier: PetitionViewCell.id)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel?.petitions.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PetitionViewCell.id, for: indexPath)
    cell.textLabel?.text = viewModel?.petitions[indexPath.row].title
    cell.detailTextLabel?.text = viewModel?.petitions[indexPath.row].body
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let petition = viewModel?.petitions[indexPath.row] else { return }
    let detailViewController = PetitionsDetailsViewController(petition: petition)
    navigationController?.pushViewController(detailViewController, animated: true)
  }
}

