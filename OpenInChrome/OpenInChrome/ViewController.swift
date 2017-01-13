

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var statusBarStyle: UIStatusBarStyle = .lightContent

    override func viewDidLoad() {
        super.viewDidLoad()
      // var refreshControl = UIRefreshControl()

//        self.webView.scrollView.delegate = self;
        webView.scrollView.delegate = self
        webView.delegate = self;
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detectChromeInstallation();

    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
 
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (scrollView.contentOffset.y < -70){
            //reach top
            print("Reach Top")
            webView.reload()
            indicator.startAnimating()}
        
      
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating();
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        indicator.stopAnimating();
    }
    // MARK: - UIViewController
    
    
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (scrollView.contentOffset.x > 0) {
//            scrollView.contentOffset = CGPoint.init(x: 0, y: scrollView.contentOffset.y)
//        }
//    }
//    
    func detectChromeInstallation() {
        let inputURL = URL(string: "https://demo-tecsynt.atiim.com")!
        
//        if OpenInChromeController.sharedInstance.isChromeInstalled() {
//            let callbackURL = URL(string: "opcsample://")
//            if !OpenInChromeController.sharedInstance.openInChrome(inputURL, callbackURL: callbackURL, createNewTab: true) {
//                log("[Failed] Cannot open \(inputURL.absoluteString) in Google Chrome. Will try to open it with system openURL")
//                if (UIApplication.shared.openURL(inputURL)) {
//                    log("[Success] Opened \(inputURL.absoluteString) by system openURL.")
//                } else {
//                    log("[Failed] Cannot open \(inputURL.absoluteString) by system openURL.")
//                }
//            } else {
//                log("[Success] Opened \(inputURL.absoluteString) in Google Chrome.")
//            }
//        } else {
            self.webView.loadRequest(URLRequest.init(url: inputURL))
            indicator.startAnimating();
        }
    }

    
    func log(_ text: String) {
        NSLog(text)
    }
    


