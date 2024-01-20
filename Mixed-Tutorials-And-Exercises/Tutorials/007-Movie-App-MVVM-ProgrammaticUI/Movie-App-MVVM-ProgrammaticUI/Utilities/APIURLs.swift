//
//  APIURLs.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 18.01.2024.
//

import Foundation

// enum yerine struct veya class da kullanibiliriz ama APIURLs() diye bi instance olusmasin diye enum ile yapcaz.
// enum icine degisken veya fonksiyon yazmak istiyorsak `static` keywordu ile yazmamiz lazim.
// aksi taktirde static yazmadan sadece `case` durumlarini yazabiliriz.
enum APIURLs {
     static func movies(page: Int) -> String {
        return "https://api.themoviedb.org/3/movie/popular?api_key=4807943ec5b9543842b626233336192f&language=en-US&page=\(page)"
    }
    
    static func imageUrl(posterPath: String) -> String {
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        return "https://api.themoviedb.org/3/movie/\(id)?api_key=4807943ec5b9543842b626233336192f&language=en-US"
    }
}
