//
//  DateView.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/29.
//

import UIKit

class DateView: BaseView {
    
    let picker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
       return view
    }()
    
    override func configureView() {
        addSubview(picker)
    }
    
    override func setConstraints() {
        picker.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}
