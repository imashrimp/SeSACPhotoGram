//
//  ViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/28.
//

import UIKit
import SeSACFrameworkd
import PhotosUI

//Protocol 값 전달 2.
protocol PassDataDelegate {
    func receiveDate(date: Date)
}

protocol ImageDelegate {
    func receiveImageData(data: UIImage?)
}


class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    
    
    //viewDidLoad보다 먼저 호출 됨. 루트뷰가 준비되는 시점.
    //super 메서드 호출X => super메서드가 호출되면 apple이 만든 기본 UIView가 생성되기 때문에
    override func loadView() {
        //이게 갈아끼우는 개념
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
        
        APIService.shared.callRequest()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .selectImage, object: nil)
    }
    
    @objc func selectImageNotificationObserver(nofitication: NSNotification) {
        
        if let name = nofitication.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
    }
    
    override func configureView() { //addSubView
        super.configureView()
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        mainView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonTapped), for: .touchUpInside)
        
        mainView.dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
        
        mainView.titleButton.addTarget(self, action: #selector(titleButtontapped), for: .touchUpInside)
        
        mainView.textViewButton.addTarget(self, action: #selector(textViewButtonTapped), for: .touchUpInside)
    }
    
    @objc func textViewButtonTapped() {
        
        let vc = TextViewButtonViewController()
        
        vc.completionHandler = { beef in
            self.mainView.textViewButton.setTitle(beef, for: .normal)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func titleButtontapped() {
        let vc = TitleViewController()
        
        //Closure 값 전달 - 3
        vc.completionHandler = { shrimp, intValue, boolValue in
            self.mainView.titleButton.setTitle(shrimp, for: .normal)
            print(intValue)
            print(boolValue)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func dateButtonTapped() {
        
        let vc = DateViewController()
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchProtocolButtonTapped() {
        
        let vc = SearchViewController()
        vc.delegate = self
        
        present(vc, animated: true)
    }
    
    //    override func setConstraints() { //제약조건
    //        super.setConstraints()
    //    }
    
    @objc func searchButtonTapped() {
        
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let getFromGallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { gallery in

            var config = PHPickerConfiguration()
            config.filter = .any(of: [.images])
            
            let phpicker = PHPickerViewController(configuration: config)
            phpicker.delegate = self
            self.present(phpicker, animated: true)
            
        }
        let searchOnWeb = UIAlertAction(title: "웹에서 검색하기", style: .default) { webResPonse in
            //MARK: - API 네트워킹 요청 이후에 뭘 하라는 건지 정확하게 모르겠음.
            print("이건 뭐 하라는 거야?")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        actionSheet.addAction(getFromGallery)
        actionSheet.addAction(searchOnWeb)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
}

extension AddViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.mainView.photoImageView.image = image as? UIImage
                }
            }
        } else {
            print("사진을 가져오지 못 했습니다.")
        }
    }
    
    
}

//Protocol 값 전달 4.
extension AddViewController: PassDataDelegate {
    
    func receiveDate(date: Date) {
        //이게 되는 이유는 searchButton이 탭 되면서 '부하직원은 AddViewController입니다.'라고 얘기했으니 아래 메서드가 작동하고 반영되는거임
        mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
}

extension AddViewController: ImageDelegate {
    func receiveImageData(data: UIImage?) {
        mainView.photoImageView.image = data
    }
}

