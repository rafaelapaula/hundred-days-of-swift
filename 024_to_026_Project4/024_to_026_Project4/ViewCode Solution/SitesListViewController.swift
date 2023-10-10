import UIKit

class SitesListViewController: UITableViewController {
  let websites = [
    (displayName: "Apple", url: URL(string: "https://www.apple.com")!),
    (displayName: "Hacking with Swift", url: URL(string: "https://www.hackingwithswift.com")!),
    (displayName: "Google", url: URL(string: "https://www.google.com")!),
    (displayName: "Github", url: URL(string: "https://www.github.com")!),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.reloadData()
    title = "Allowed Websites"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    websites.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = websites[indexPath.row].displayName
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailViewController = SiteDetailViewController()
    detailViewController.website = websites[indexPath.row]
    navigationController?.pushViewController(detailViewController, animated: true)
  }
}
