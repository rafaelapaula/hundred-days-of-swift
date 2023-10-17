//
//  ViewController.swift
//  033_to_035_Project7
//
//  Created by rafaela.lourenco on 17/10/23.
//

import UIKit

class RecentPetitionsViewController: UITableViewController {
  
  lazy var viewModel: RecentPetitionsViewModelProtocol = RecentPetitionsViewModel(delegate: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    registerViewCell()
    viewModel.load()
  }
  
  func configureNavigationBar() {
    title = "Recent Petitions"
  }
}

extension RecentPetitionsViewController: PetitionsDelegate {
  func shouldReloadList() {
    tableView.reloadData()
  }
  
  func didGetAnError(message: String) {
    print("[ERROR] \(message)")
  }
}

extension RecentPetitionsViewController {
  
  func registerViewCell() {
    tableView.register(PetitionViewCell.self, forCellReuseIdentifier: PetitionViewCell.id)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.petitions.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PetitionViewCell.id, for: indexPath)
    cell.textLabel?.text = viewModel.petitions[indexPath.row].title
    cell.detailTextLabel?.text = viewModel.petitions[indexPath.row].body
    return cell
  }
}

