import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  lazy var webView = WKWebView()
  lazy var progressView = UIProgressView(progressViewStyle: .default)
  lazy var websites = ["hackingwithswift.com", "apple.com"]

  override func loadView() {
    webView.navigationDelegate = self
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    
    let url = URL(string: "https://\(websites[0])")!
    webView.load(URLRequest(url: url)) // https://stackoverflow.com/a/74933432
    webView.allowsBackForwardNavigationGestures = true
  }
  
  func configure() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
    
    progressView.sizeToFit()
    let progress = UIBarButtonItem(customView: progressView)
    
    toolbarItems = [progress, spacer, refresh]
    navigationController?.isToolbarHidden = false
    
    webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
  }

  @objc func openTapped() {
    let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
    
    websites.forEach { site in
      ac.addAction(UIAlertAction(title: site, style: .default, handler: openPage))
    }
    
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    
    present(ac, animated: true)
  }
  
  func openPage(action: UIAlertAction) {
    guard let url = URL(string: "http://\(action.title!)") else { return }
    webView.load(URLRequest(url: url))
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    title = webView.title
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == #keyPath(WKWebView.estimatedProgress) {
      progressView.progress = Float(webView.estimatedProgress)
    }
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    let url = navigationAction.request.url
    if let host = url?.host {
      for site in websites {
        if host.contains(site) {
          decisionHandler(.allow)
          return
        }
      }
    }
    decisionHandler(.cancel)
  }
}

