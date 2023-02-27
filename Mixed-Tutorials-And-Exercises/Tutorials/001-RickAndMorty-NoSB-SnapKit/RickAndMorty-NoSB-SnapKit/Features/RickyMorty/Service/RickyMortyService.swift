//
//  RickyMortyService.swift
//  RickAndMorty-NoSB-SnapKit
//
//  Created by Osman Emre Ömürlü on 26.02.2023.
//

import Alamofire

enum RickyMortyServiceEndPoind: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortiyeService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickyMortyService: IRickyMortiyeService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndPoind.characterPath()).responseDecodable(of: PostModel.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}
