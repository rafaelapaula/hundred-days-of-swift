import WebKit
import UIKit

class PetitionsDetailsViewController: UIViewController {
  let webView = WKWebView()
  
  var petition: Petition?
  
  convenience init(petition: Petition? = nil) {
    self.init()
    self.petition = petition
  }
  
  override func loadView() {
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureWebView()
  }
  
  func configureWebView() {
    guard let petition = petition else { return }
    
    let html = """
      <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <style> body { font-size: 150%; } </style>
        </head>
        <body>
          \(petition.body)
        </body>
      </html>
    """
    
    webView.loadHTMLString(html, baseURL: nil)
  }
}
