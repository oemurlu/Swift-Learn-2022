//
//  RickyMortyViewController.swift
//  RickAndMorty-NoSB-SnapKit
//
//  Created by Osman Emre Ömürlü on 26.02.2023.
//

import UIKit
import SnapKit

protocol RickyMortyOutput {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class RickyMortyViewController: UIViewController {
    
    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var results: [Result] = []
    lazy var viewModel: IRickyMortyViewModel = RickyMortyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }
    
    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        
        drawDesingn()
        makeLabel()
        makeIndicator()
        makeTableView()
    }
    
    private func drawDesingn() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RickyMortyTableViewCell.self, forCellReuseIdentifier: RickyMortyTableViewCell.Identifier.custom.rawValue)
        tableView.rowHeight = self.view.frame.size.height * 0.22
        
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Ricky Morty"
            self.indicator.color = .red
            self.indicator.startAnimating()
        }
    }
}

extension RickyMortyViewController: RickyMortyOutput {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
}

extension RickyMortyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RickyMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickyMortyTableViewCell.Identifier.custom.rawValue) as? RickyMortyTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
}

extension RickyMortyViewController {
    
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5) //box top constrainti labelTitle'nin bottomundan 5 padding uzaklikta olsun. px mi padding mi?
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    
    private func makeLabel() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(10) // soldan 10 padding
            make.right.equalToSuperview().offset(-10) // sagdan 10 padding. -10 demek sola dogru padding demek.
            make.height.greaterThanOrEqualTo(10) //height 10 veya 10'dan fazla paddinglik yukseklik olacak
        }
    }
    
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}
