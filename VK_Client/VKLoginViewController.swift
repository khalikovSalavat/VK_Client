//
//  VKLoginViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 12.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit
import WebKit
import RealmSwift

class VKLoginViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7565237"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html", let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }
        
        let params = fragment
        .components(separatedBy: "&")
        .map { $0.components(separatedBy: "=") }
            .reduce([String: String] ()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"],
            let usedIdString = params["user_id"],
            let _ = Int(usedIdString) else {
                decisionHandler(.allow)
                return
        }
        
        print(token)
              
        Session.shared.token = token
        Session.shared.userID = Int(usedIdString)!
        
        decisionHandler(.cancel)
        
        if let tabView = storyboard?.instantiateViewController(withIdentifier: "tabBarStoryBoard") as? UITabBarController {
            present(tabView, animated: true, completion: nil)
        }
    }
}
