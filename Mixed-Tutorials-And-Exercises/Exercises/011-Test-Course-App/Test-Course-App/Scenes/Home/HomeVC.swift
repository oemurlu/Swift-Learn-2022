//
//  HomeVC.swift
//  Test-Course-App
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import UIKit

protocol HomeVCInterface: AnyObject {
    func configureVC()
    func configureTableView()
    func reloadTableViewOnMain()
}

class HomeVC: UIViewController {
 
    private var tableView: UITableView!
    let viewModel: HomeVM
    
    init(viewModel: HomeVM) {
        print("HomeVC init")
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    deinit {
        print("HomeVC deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
}

extension HomeVC: HomeVCInterface {
    func configureVC() {
        view.backgroundColor = .systemGray5
    }
    
    func configureTableView() {
        tableView = UITableView(frame: .zero)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CourseCell.self, forCellReuseIdentifier: CourseCell.reuseID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.pinToEdgesOfSafeArea(view: view)
    }
    
    func reloadTableViewOnMain() {
        tableView.reloadDataOnMainThread()
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseCell.reuseID, for: indexPath) as! CourseCell
        cell.setCell(course: viewModel.courseList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
