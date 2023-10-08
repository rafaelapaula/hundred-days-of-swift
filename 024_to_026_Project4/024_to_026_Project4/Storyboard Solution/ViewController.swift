import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  lazy var webView = WKWebView()

  override func loadView() {
    webView.navigationDelegate = self
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    
    let url = URL(string: "https://www.hackingwithswift.com")!
    webView.load(URLRequest(url: url)) // https://stackoverflow.com/a/74933432
    webView.allowsBackForwardNavigationGestures = true
  }

  @objc func openTapped() {
    let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
    
    ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
    ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    
    present(ac, animated: true)
  }
  
  func openPage(action: UIAlertAction) {
    guard let url = URL(string: "http://\(action.title!)") else { return }
    webView.load(URLRequest(url: url))
  }

}

