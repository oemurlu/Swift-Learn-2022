//
//  PeopleViewModel.swift
//  testingExample
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import Foundation

final class PeopleViewModel {
    
//    typealias PersonFilter = (Person) -> Bool
    
    var people: [Person] = []
    var filters: [(Person) -> Bool] = []
    
    init(people: [Person], filters: [(Person) -> Bool] = []) {
        self.people = people
        self.filters = filters
    }
    
    var peopleMatchingFilters: [Person] {
        var filteredPeople = people
        
        for filter in filters {
            filteredPeople = filteredPeople.filter(filter)
        }
        
        return filteredPeople
    }
}

