

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.webView.scrollView.delegate = self;
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detectChromeInstallation();

    }
//    
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
          
        }
    }
    
    func log(_ text: String) {
        NSLog(text)
    }
    


