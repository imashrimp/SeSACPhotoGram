//
//  BaseViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/28.
//

import UIKit
import SnapKit

//얼럿을 많이 띄우는 형태이면, 여기에 얼럿에 대한 메서드를 작성해도 됨.
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setConstraints()

    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    
    func setConstraints() {
    }
}
