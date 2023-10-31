import Foundation

protocol PetitionsListViewModelProtocol {
  func petitions() -> [Petition]
  func load()
  func filter(with text: String)
}

protocol PetitionsDelegate: AnyObject {
  func shouldReloadList()
  func didGetAnError(message: String)
}

class PetitionsListViewModel: PetitionsListViewModelProtocol {
  weak var delegate: PetitionsDelegate?
  
  var allPetitions = [Petition]()
  var filteredPetitions = [Petition]()
  var searchText = ""
  
  let url: URL
  
  init(
    delegate: PetitionsDelegate? = nil,
    url: URL
  ) {
    self.delegate = delegate
    self.url = url
  }
  
  func petitions() -> [Petition] {
    if searchText.isEmpty {
      return allPetitions
    }
    return filteredPetitions
  }
  
  func filter(with text: String) {
    searchText = text.lowercased()
    
    filteredPetitions = allPetitions.filter({
      $0.title.lowercased().contains(searchText) || $0.body.lowercased().contains(searchText)
    })
    
    delegate?.shouldReloadList()
  }
  
  func load() {
    DispatchQueue.global(qos: .background).async { [weak self] in
      guard
        let url = self?.url,
        let data = try? Data(contentsOf: url)
      else {
        DispatchQueue.main.async { [weak self] in
          self?.delegate?.didGetAnError(message: "Unable to get data from URL")
        }
        return
      }
      
      self?.parse(data)
    }
  }
  
  func parse(_ data: Data) {
    let decoder = JSONDecoder()
    guard
      let petitions = try? decoder.decode(Petitions.self, from: data)
    else {
      DispatchQueue.main.async { [weak self] in
        self?.delegate?.didGetAnError(message: "Unable to parse the information")
      }
      return
    }
    
    self.allPetitions = petitions.results
    
    DispatchQueue.main.async { [weak self] in
      self?.delegate?.shouldReloadList()
    }
    
    
  }
}
