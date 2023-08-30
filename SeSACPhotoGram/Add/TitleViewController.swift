//
//  TitleViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
    
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요."
        return view
    }()
    
    //Closure 값 전달 - 1
    var completionHandler: ((String, Int, Bool) -> Void)?
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain
                                                            , target: self, action: #selector(doneButtonTapped))
    }
    
    @objc func doneButtonTapped() {
        
        completionHandler?(textField.text!, 8, true)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        Closure 값 전달 - 2
        completionHandler?(textField.text!, 100, false)
        
        
    }
}
