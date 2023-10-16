import Foundation

protocol GoodsListViewModelProtocol {
  var goods: [String] { get }
  
  func add(_ item: String)
}

protocol GoodsListDelegate: AnyObject {
  func insert(_ item: String, at indexPath: IndexPath)
}

class GoodsListViewModel: GoodsListViewModelProtocol {
  weak var delegate: GoodsListDelegate?
  
  var goods = [String]()
  
  init(delegate: GoodsListDelegate? = nil) {
    self.delegate = delegate
  }
  
  func add(_ item: String) {
    goods.insert(item, at: 0)
    delegate?.insert(item, at: IndexPath(row: 0, section: 0))
  }
  
}
