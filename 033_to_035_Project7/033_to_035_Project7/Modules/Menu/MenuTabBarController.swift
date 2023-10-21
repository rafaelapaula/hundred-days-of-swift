import UIKit

class MenuTabBarController: UITabBarController {
  
  lazy var recentPetitions = (
    viewController: UINavigationController(
      rootViewController: PetitionsListViewController(url: URL.recentPetitions())),
    tag: 0)
  
  lazy var topRatedPetitions = (
    viewController: UINavigationController(rootViewController: PetitionsListViewController(url: URL.topRatedPetitions())),
    tag: 1)
  
  override func viewDidLoad() {
    configureViewControllers()
  }
  
  func configureViewControllers() {
    recentPetitions.viewController.tabBarItem = UITabBarItem(
      title: "Recent",
      image: .checkmark,
      tag: recentPetitions.tag)
    recentPetitions.viewController.viewControllers.first?.title = "Recent"
    
    topRatedPetitions.viewController.tabBarItem = UITabBarItem(
      title: "Top Rated",
      image: .add,
      tag: topRatedPetitions.tag)
    topRatedPetitions.viewController.viewControllers.first?.title = "Top Rated"
    
    viewControllers = [
      recentPetitions.viewController,
      topRatedPetitions.viewController
    ]
  }
}
