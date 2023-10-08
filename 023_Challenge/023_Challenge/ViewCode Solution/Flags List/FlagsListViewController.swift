import UIKit

class FlagsListViewController: UITableViewController {
  lazy var viewModel: FlagsListViewModelProtocol = FlagsListViewModel(self)
  lazy var flags = [String]() {
    didSet {
      tableView.reloadData()
    }
  }
}

// MARK: - Life cycle
extension FlagsListViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Flags"
    navigationController?.navigationBar.prefersLargeTitles = true
    viewModel.load()
  }
}

// MARK: - FlagsDelegate
extension FlagsListViewController: FlagsDelegate {
  func flagsDidLoad(_ flags: [String]) {
    self.flags = flags
  }
}

// MARK: - TableViewDataSource
extension FlagsListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { flags.count }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = FlagsViewCell()
    cell.configure(name: flags[indexPath.row])
    return cell
  }
}

// MARK: - TableViewDelegate
extension FlagsListViewController {
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    view.frame.width * 0.15 + 20.0
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard
      let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
    else { return }
    vc.flagInfo = (path: flags[indexPath.row], name: flags[indexPath.row].uppercased())
    navigationController?.pushViewController(vc, animated: true)
  }
}
