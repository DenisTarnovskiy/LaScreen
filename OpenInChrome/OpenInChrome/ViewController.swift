

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detectChromeInstallation();

    }
    
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
    


