//
//  ViewController.swift
//  TopYoutubeChannels
//
//  Created by Osman Emre Ömürlü on 24.02.2024.
//

import UIKit
import SafariServices

class PeopleViewController: UIViewController {
    
    private let viewModel = PeopleViewModel()
    
    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.delegate = self
        viewModel.getUsers()
    }
    
    
}

extension PeopleViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.people[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        cell.item = item
        cell.delegate = self
        return cell
    }
}

extension PeopleViewController: PeopleViewModelDelegate {
    func didFinish() {
        self.cv.reloadData()
    }
    
    func didFail(error: Error) {
        print(error.localizedDescription)
    }
}

extension PeopleViewController: PersonCollectionViewCellDelegate {
    func didTapSubscribe() {
        let url = URL(string: "https://oemurlu.dev")!
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .formSheet
        
        self.present(vc, animated: true)
    }
}

private extension PeopleViewController {
    func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "People"
        self.view.backgroundColor = .white
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
}

