//
//  DetailViewModel.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 19.01.2024.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? { get set }
    func viewDidLoad()
    func viewDidLayoutSubviews()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface? //bu view weak olmasaydi DetailScreen deinit olmazdi.
    
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImageView()
        view?.configuretitleLabel()
        view?.configuredateLabel()
        view?.configureOverviewTextView()
        // bunlari initialize ederken sirasi onemli. mesela titleLabel'i posterImageView'e gore hizaladigimiz icin posterImageView'i titleLabel'den daha once initialize etmemiz lazim.
    }
    
    func viewDidLayoutSubviews() {
        view?.configureSubViewForTextView()
    }
}
