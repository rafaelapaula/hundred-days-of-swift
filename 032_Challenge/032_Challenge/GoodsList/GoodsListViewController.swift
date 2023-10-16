import UIKit

class GoodsListViewController: UITableViewController {
  
  lazy var viewModel: GoodsListViewModelProtocol = GoodsListViewModel(delegate: self)

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCell()
    configureNavigationBar()
  }
  
  func configureNavigationBar() {
    title = "Goods list"
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .add,
      target: self,
      action: #selector(presentAddField))
  }
  
  @objc func presentAddField() {
    let alert = UIAlertController(
      title: "Add a new item",
      message: "Please, type your new item for your goods list:",
      preferredStyle: .alert)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
    let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
      guard let item = alert.textFields?.first?.text else { return }
      self?.viewModel.add(item)
    }
    
    alert.addTextField()
    alert.addAction(cancelAction)
    alert.addAction(addAction)
    
    present(alert, animated: true)
  }

}

extension GoodsListViewController: GoodsListDelegate {
  func insert(_ item: String, at indexPath: IndexPath) {
    tableView.insertRows(at: [indexPath], with: .fade)
  }
}

extension GoodsListViewController {
  
  func registerCell() {
    tableView.register(GoodViewCell.self, forCellReuseIdentifier: GoodViewCell.description())
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.goods.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: GoodViewCell.description(), for: indexPath)
    cell.textLabel?.text = viewModel.goods[indexPath.row]
    return cell
  }
}

