//
//  APIService.swift
//  SeSACPhotoGram
//
//  Created by 권현석 on 2023/08/30.
//

import Foundation

class APIService {
    
    private init() { }
    
    static let shared = APIService() //인스턴스 생성 방지
    
    func callRequest() {
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/GianniTumino_SturgeonMoon_Palette_JPG_LOGO_2048.jpg")
        
        let request = URLRequest(url: url!)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
            print(response)
            print(error)
        }.resume()
        
    }
    
}
