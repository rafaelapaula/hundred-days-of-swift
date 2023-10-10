import UIKit
import WebKit

class SiteDetailViewController: UIViewController, WKNavigationDelegate {
  let webView = WKWebView()
  let progressView = UIProgressView(progressViewStyle: .default)
  var website: (displayName: String, url: URL)?

  override func loadView() {
    webView.navigationDelegate = self
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let website = website else { return }
    
    webView.load(URLRequest(url: website.url))
    webView.allowsBackForwardNavigationGestures = true
    
    title = website.displayName
    navigationItem.largeTitleDisplayMode = .never
    navigationController?.navigationBar.backgroundColor = .white
    
    configure()
  }
  
  func configure() {
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
    
    progressView.sizeToFit()
    let progress = UIBarButtonItem(customView: progressView)
    
    toolbarItems = [progress, spacer, refresh]
    navigationController?.isToolbarHidden = false
    
    webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == #keyPath(WKWebView.estimatedProgress) {
      progressView.progress = Float(webView.estimatedProgress)
    }
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    let url = navigationAction.request.url
    let currentHost = url?.host
    let host = website?.url.host
    
    if currentHost == nil || host?.contains(currentHost ?? "invalid") ?? false {
      decisionHandler(.allow)
      return
    }
    
    decisionHandler(.cancel)
    let ac = UIAlertController(title: "This host is not allowed!", message: nil, preferredStyle: .actionSheet)
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(ac, animated: true)
  }
}

