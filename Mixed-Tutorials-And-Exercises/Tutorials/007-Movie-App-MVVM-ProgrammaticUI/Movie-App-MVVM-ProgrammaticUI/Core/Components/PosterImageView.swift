//
//  PosterImageView.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 18.01.2024.
//

import UIKit

final class PosterImageView: UIImageView {

    private var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(movie: MovieResult) {
        guard let url = URL(string: APIURLs.imageUrl(posterPath: movie._posterPath)) else { return }
        
//        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else { return } // response ve error lazim degil. bize resim lazim sadece. resim donmezse bos cell gozukecek. bos cell yerine placeholder vs gostermek istiyorsak error'u kontrol edebiliriz guzel olur oyle.
//            // indirme islemleri vs hep backgroundda yapilir ama ui ile ilgili isler main thread'de yapilir.
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data)
//            }
//        }
        
        dataTask = NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
            
        }
//        dataTask?.resume() //buna gerek yok cunku network manager zaten resume ediyo
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil //retain cycle problemi yasamamak icin. ram'den silinsin diye.
    }
    
}
