

import UIKit
import SystemConfiguration
class ViewController: UIViewController, UIScrollViewDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var statusBarStyle: UIStatusBarStyle = .lightContent

    override func viewDidLoad() {
        super.viewDidLoad()

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
        if (scrollView.contentOffset.y < -70) {
            //reach top
            print("Reach Top")
            
            if (self.webView.request != nil) {
                webView.reload()
            } else {
                let inputURL = URL(string: "https://demo-tecsynt.atiim.com")!
                self.webView.loadRequest(URLRequest.init(url: inputURL))
            }
            
            let flag = self.isInternetAvailable()
            if flag {
                if !self.popup.isHidden {
                    self.popup.isHidden = true
                }
                indicator.startAnimating()
            } else {
                webView.stringByEvaluatingJavaScript(from: "document.open();document.close()")
                if self.popup.isHidden {
                    self.popup.isHidden = false
                }
            }
            }
    }

    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating();
        if !self.popup.isHidden {
            self.popup.isHidden = true
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        indicator.stopAnimating();
        if self.popup.isHidden {
            self.popup.isHidden = false
        }
        
    }
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    func detectChromeInstallation() {
        let flag = self.isInternetAvailable()
        if flag {
            let inputURL = URL(string: "https://demo-tecsynt.atiim.com")!
            self.webView.loadRequest(URLRequest.init(url: inputURL))
            indicator.startAnimating();
        } else {
            if self.popup.isHidden {
                self.popup.isHidden = false
            }
        }
        }
    }

    
    func log(_ text: String) {
        NSLog(text)
    }
    


