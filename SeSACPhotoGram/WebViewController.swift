//
//  WebViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/29.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate {
    
    var webView = WKWebView()
    
//    override func loadView() {
////        let webConfiguration = WKWebViewConfiguration()
////        webView = WKWebView(frame: .zero, configuration: webConfiguration)
////        webView.uiDelegate = self
////        view = webView
//        
//        //네비게이션 컨트롤러가 처음에 투명, 스크롤 하면 불투명
//  
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(100)
        }
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        title = "이건 웹뷰입니다."
    }
    
    func reloadButtonTapped() {
        webView.reload()
    }
    
    func goBackButtonTapped() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func goForwardButtonTapped() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
