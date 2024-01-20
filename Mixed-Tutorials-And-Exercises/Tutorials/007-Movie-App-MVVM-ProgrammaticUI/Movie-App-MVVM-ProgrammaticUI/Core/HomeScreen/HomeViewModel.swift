//
//  HomeViewModel.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 18.01.2024.
//

//ViewModel

// ViewModel ile ViewController arasindaki haberlesmeyi protocol ile yapalim.
import Foundation

// protocol icine fonksiyonlari ve view'i yaziyomus. tum degiskenleri yazmiyomus.
protocol HomeViewModelInterface {
    var view: HomeScreenInterface? { get set }
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page: Int = 1
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
            
            self.view?.navigateToDetailScreen(movie: returnedDetail)
        }
    }
    

}
