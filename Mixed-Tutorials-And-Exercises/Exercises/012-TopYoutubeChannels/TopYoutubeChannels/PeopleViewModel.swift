//
//  PeopleViewModel.swift
//  TopYoutubeChannels
//
//  Created by Osman Emre Ömürlü on 25.02.2024.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    func didFinish()
    func didFail(error: Error)
}

final class PeopleViewModel {
    
    private(set) var people = [PersonResponse]()
    
    weak var delegate: PeopleViewModelDelegate?
    
    @MainActor // it provides execution on main thread
    func getUsers() {
        Task { [weak self] in
            guard let self = self else { return }
            
            do {
                guard let url = URL(string: "https://reqres.in/api/users") else { return }
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.people = try jsonDecoder.decode(UserResponse.self, from: data).data
                self.delegate?.didFinish()
            } catch {
                self.delegate?.didFail(error: error)
            }
        }
    }
}
