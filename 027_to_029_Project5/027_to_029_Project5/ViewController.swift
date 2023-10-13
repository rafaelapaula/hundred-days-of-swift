//
//  ViewController.swift
//  027_to_029_Project5
//
//  Created by rafaela.lourenco on 11/10/23.
//

import UIKit

class ViewController: UITableViewController {
  
  lazy var viewModel: ViewModelProtocol = ViewModel(delegate: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
    viewModel.load()
  }
  
  func configureView() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(play))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  @objc func play() {
    viewModel.play()
  }
  
  @objc func promptForAnswer() {
    let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
    ac.addTextField()
    
    let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
      guard let answer = ac?.textFields?.first?.text else { return }
      self?.viewModel.submit(answer.lowercased())
    }
    
    ac.addAction(submitAction)
    present(ac, animated: true)
  }
  
}

extension ViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.inputedWords.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
    cell.textLabel?.text = viewModel.inputedWords[indexPath.row]
    return cell
  }
}

extension ViewController: AnagramDelegate {
  func didStartRound(with word: String) {
    title = word
    tableView.reloadData()
  }
  
  func didGetAnError(_ message: String) {
    let ac = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .cancel))
    present(ac, animated: true)
  }
  
  func insertRow(at indexPath: IndexPath) {
    tableView.insertRows(at: [indexPath], with: .top)
  }
}

