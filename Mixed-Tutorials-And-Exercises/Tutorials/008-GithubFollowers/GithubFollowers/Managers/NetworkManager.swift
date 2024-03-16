//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 28.02.2024.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601 // we can set createdAt as a Date instead of String in User.swift model.
    }
    
    
    //    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> ()) {
    //        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
    //
    //        guard let url = URL(string: endPoint) else {
    //            completion(.failure(.invalidUsername))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    //
    //            if let _ = error {
    //                completion(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completion(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completion(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //
    //                let followers = try decoder.decode([Follower].self, from: data)
    //                completion(.success(followers))
    //            } catch {
    //                completion(.failure(.invalidData))
    //            }
    //
    //        }
    //        task.resume()
    //    }
    
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            throw GFError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        do {
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw GFError.invalidData
        }
    }
    
    
    func getUserInfo(for username: String) async throws -> User {
        let endPoint = baseURL + "\(username)"
        
        guard let url = URL(string: endPoint) else {
            throw GFError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
            
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
            
        do {
            return try decoder.decode(User.self, from: data)
            } catch {
                throw GFError.invalidData
            }
        
    }
    
    
//    func getUserInfo(for username: String, completion: @escaping (Result<User, GFError>) -> ()) {
//        let endPoint = baseURL + "\(username)"
//        
//        guard let url = URL(string: endPoint) else {
//            completion(.failure(.invalidUsername))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            if let _ = error {
//                completion(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                
//                let user = try decoder.decode(User.self, from: data)
//                completion(.success(user))
//            } catch {
//                completion(.failure(.invalidData))
//            }
//            
//        }
//        task.resume()
//    }
    
    
    
    func downloadImage(from urlString: String) async ->  UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { return image }
        // if we have the cache of image return here. dont go more. but if we dont have the cache of image go and download the image.
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil}
            cache.setObject(image, forKey: cacheKey) // cache the downloaded image.
            return image
        } catch {
            return nil
        }
    }
    
    
//    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> ()) {
//        let cacheKey = NSString(string: urlString)
//        if let image = cache.object(forKey: cacheKey) {
//            completion(image)
//            return // if we have the cache of image return here. dont go more. but if we dont have the cache of image go and download the image.
//        }
//        
//        guard let url = URL(string: urlString) else {
//            completion(nil)
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//            guard let self = self,
//                  error == nil,
//                  let respone = response as? HTTPURLResponse, respone.statusCode == 200,
//                  let data = data,
//                  let image = UIImage(data: data) else {
//                completion(nil)
//                return
//            }
//            
//            self.cache.setObject(image, forKey: cacheKey) // cache the downloaded image.
//            completion(image)
//        }
//        task.resume()
//    }
}


