//
//  SearchViewController.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {

    let mainView = SearchView()
    
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    
    var delegate: ImageDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    //이걸 안 써도 됨. 왜냐하면, 화면전환 시 이 뷰컨의 인스턴스가 생성되면서, BaseViewController가 상속하는 UIViewController 클래스가 가진 viewDidLoad 메서드가 실행되기 때문에
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKeyword"), object: nil)
        
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
    }

    override func configureView() {
        super.configureView()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self

    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // userInfo가 값 전달의 역할을 담당
//        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"])
        
        delegate?.receiveImageData(data: UIImage(systemName: imageList[indexPath.row]))
//        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else { return UICollectionViewCell()}
        
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        
        return cell
    }
}

