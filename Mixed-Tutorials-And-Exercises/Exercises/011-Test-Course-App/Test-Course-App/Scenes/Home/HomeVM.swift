//
//  HomeVM.swift
//  Test-Course-App
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import Foundation

protocol HomeVMInterface {
    var view: HomeVCInterface? { get }
    func viewDidLoad()
    func fetchCourses()
}

class HomeVM {
    weak var view: HomeVCInterface?
    var courseList: [Course] = []
    private let service: NetworkManagerProtocol
    
    init(service: NetworkManagerProtocol) {
        self.service = service
        print("HomeVM init")
    }
    
    deinit {
        print("HomeVM deinit")
    }
}

extension HomeVM: HomeVMInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureTableView()
        fetchCourses()
    }
    
    func fetchCourses() {
        service.fetchCourses { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let courses):
                self.courseList = courses
                view?.reloadTableViewOnMain()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
