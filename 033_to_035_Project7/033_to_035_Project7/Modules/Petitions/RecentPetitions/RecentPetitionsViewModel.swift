import Foundation

protocol RecentPetitionsViewModelProtocol {
  var petitions: [Petition] { get }
  
  func load()
}

protocol PetitionsDelegate: AnyObject {
  func shouldReloadList()
  func didGetAnError(message: String)
}

class RecentPetitionsViewModel: RecentPetitionsViewModelProtocol {
  weak var delegate: PetitionsDelegate?
  
  var petitions = [Petition]()
  
  init(delegate: PetitionsDelegate? = nil) {
    self.delegate = delegate
  }
  
  func load() {
    guard
      let data = try? Data(contentsOf: Constants.Urls.petitions)
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
