//
//  DateViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {
    
    let mainView = DateView()
 
    //Protocol 값 전달 2. =>일을 본격적으로 해야하는 VC가 부하직원(delegate)를 가짐
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Protocol 값 전달 3. => 부하직원에게 무슨 일을 시킬지 정함. 하지만 실제로 일을 하지는 않음
        delegate?.receiveDate(date: mainView.picker.date)
    }
}
