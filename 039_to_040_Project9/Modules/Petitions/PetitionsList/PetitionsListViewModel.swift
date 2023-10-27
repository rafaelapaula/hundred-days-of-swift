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
    /*
     
     - User Interactive: this is the highest priority background thread, and should be used when you want a background thread to do work that is important to keep your user interface working. This priority will ask the system to dedicate nearly all available CPU time to you to get the job done as quickly as possible.
     
     - User Initiated: this should be used to execute tasks requested by the user that they are now waiting for in order to continue using your app. It's not as important as user interactive work – i.e., if the user taps on buttons to do other stuff, that should be executed first – but it is important because you're keeping the user waiting.
     
     - The Utility queue: this should be used for long-running tasks that the user is aware of, but not necessarily desperate for now. If the user has requested something and can happily leave it running while they do something else with your app, you should use Utility.
     
     - The Background queue: this is for long-running tasks that the user isn't actively aware of, or at least doesn't care about its progress or when it completes.
     
     */
    
    DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      
      guard
        let url = self?.url,
        let data = try? Data(contentsOf: url)
      else {
        DispatchQueue.main.async { [weak delegate = self?.delegate] in
          delegate?.didGetAnError(message: "Unable to get data from URL")
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
      DispatchQueue.main.async { [weak delegate] in
        delegate?.didGetAnError(message: "Unable to parse the information")
      }
      return
    }
    
    self.allPetitions = petitions.results
    DispatchQueue.main.async { [weak delegate] in
      delegate?.shouldReloadList()
    }
  }
}
