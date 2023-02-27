//
//  RickyMortyViewModel.swift
//  RickAndMorty-NoSB-SnapKit
//
//  Created by Osman Emre Ömürlü on 26.02.2023.
//

import Foundation

protocol IRickyMortyViewModel {
    
    func fetchItems()
    func changeLoading()
    func setDelegate(output: RickyMortyOutput)
    
    var rickyMortyCharacters: [Result] { get set }
    var rickyMortyService: IRickyMortiyeService { get }
    var rickyMortyOutput: RickyMortyOutput? { get }
}

final class RickyMortyViewModel: IRickyMortyViewModel {
    func setDelegate(output: RickyMortyOutput) {
        rickyMortyOutput = output
    }
    
    var rickyMortyOutput: RickyMortyOutput?
    var rickyMortyCharacters: [Result] = []
    private var isLoading = false
    let rickyMortyService: IRickyMortiyeService
    
    init() {
        rickyMortyService = RickyMortyService()
    }
    
    func fetchItems() {
        changeLoading()
        rickyMortyService.fetchAllDatas { [weak self] response in
            self?.changeLoading()
            self?.rickyMortyCharacters = response ?? []
            self?.rickyMortyOutput?.saveDatas(values: self?.rickyMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickyMortyOutput?.changeLoading(isLoad: isLoading)
    }
}
