import UIKit

class MenuTabBarController: UITabBarController {
  
  lazy var recentPetitions = (
    viewController: UINavigationController(rootViewController: RecentPetitionsViewController()),
    tag: 0)
  
  override func viewDidLoad() {
    configureViewControllers()
  }
  
  func configureViewControllers() {
    recentPetitions.viewController.tabBarItem = UITabBarItem(
      title: "Recent",
      image: .checkmark,
      tag: recentPetitions.tag)
    
    viewControllers = [
      recentPetitions.viewController
    ]
  }
}
