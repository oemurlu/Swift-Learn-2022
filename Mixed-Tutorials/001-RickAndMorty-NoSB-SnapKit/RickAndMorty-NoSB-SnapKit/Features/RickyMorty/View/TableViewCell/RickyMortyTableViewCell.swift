//
//  RickyMortyTableViewCell.swift
//  RickAndMorty-NoSB-SnapKit
//
//  Created by Osman Emre Ömürlü on 26.02.2023.
//

import UIKit
import AlamofireImage

class RickyMortyTableViewCell: UITableViewCell {

    private let customImage: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    private let status: UILabel = UILabel()
    
    private lazy var randomImage: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case custom = "vb10"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDescription)
        addSubview(status)
        
        title.font = .boldSystemFont(ofSize: 18)
        status.font = .italicSystemFont(ofSize: 14)
        customDescription.font = .italicSystemFont(ofSize: 14)
        
        status.text = "Status:"
        
        customImage.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(10)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.top).offset(10)
            make.left.equalTo(customImage.snp.right).offset(20)
        }
        
        status.snp.makeConstraints { make in
            make.left.equalTo(title.snp.left)
            make.top.equalTo(title.snp.bottom).offset(10)
        }
        
        customDescription.snp.makeConstraints { make in
            make.centerY.equalTo(status)
            make.left.equalTo(status.snp.right).offset(3)
        }
    }
    
    func saveModel(model: Result) {
        title.text = model.name
        customDescription.text = model.status?.rawValue
        customImage.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
    }
}
