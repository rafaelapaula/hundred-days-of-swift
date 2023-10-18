import Foundation

protocol PetitionsListViewModelProtocol {
  var petitions: [Petition] { get }
  
  func load()
}

protocol PetitionsDelegate: AnyObject {
  func shouldReloadList()
  func didGetAnError(message: String)
}

class PetitionsListViewModel: PetitionsListViewModelProtocol {
  weak var delegate: PetitionsDelegate?
  
  var petitions = [Petition]()
  let url: URL
  
  init(
    delegate: PetitionsDelegate? = nil,
    url: URL
  ) {
    self.delegate = delegate
    self.url = url
  }
  
  func load() {
    guard
      let data = try? Data(contentsOf: url)
    else {
      delegate?.didGetAnError(message: "Unable to get data from URL")
      return
    }
    
    parse(data)
  }
  
  func parse(_ data: Data) {
    let decoder = JSONDecoder()
    guard
      let petitions = try? decoder.decode(Petitions.self, from: data)
    else {
      delegate?.didGetAnError(message: "Unable to parse the information")
      return
    }
    
    self.petitions = petitions.results
    delegate?.shouldReloadList()
    
  }
}
