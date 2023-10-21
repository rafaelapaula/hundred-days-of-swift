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
    configureNavigationBar()
    viewModel?.load()
  }
  
  func configureNavigationBar() {
    
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Type what you want to find.."
    
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Info",
      image: UIImage(systemName: "info.circle"),
      target: self,
      action: #selector(didTapInformation)
    )
  }
  
  @objc func didTapInformation() {
    let ac = UIAlertController(
      title: "Information",
      message: "The data comes from the We The People API of the Whitehouse",
      preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default)
    
    ac.addAction(okAction)
    
    present(ac, animated: true)
  }
}

extension PetitionsListViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    viewModel?.filter(with: searchController.searchBar.text ?? "") 
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
    viewModel?.petitions().count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: PetitionViewCell.id, for: indexPath) as? PetitionViewCell,
      let petition = viewModel?.petitions()[indexPath.row]
    else {
      return UITableViewCell()
    }
    
    cell.configure(title: petition.title, description: petition.body)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let petition = viewModel?.petitions()[indexPath.row] else { return }
    let detailViewController = PetitionsDetailsViewController(petition: petition)
    navigationController?.pushViewController(detailViewController, animated: true)
  }
}

