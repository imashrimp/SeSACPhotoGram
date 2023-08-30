//
//  TextViewButtonViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/29.
//

import UIKit

class TextViewButtonViewController: BaseViewController {
    
    let textView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var completionHandler: ((String) -> Void)?
    
    override func configureView() {
        super.configureView()
        view.addSubview(textView)
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        completionHandler?(textView.text)
    }
}
