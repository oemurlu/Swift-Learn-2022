//
//  PersonCollectionViewCell.swift
//  TopYoutubeChannels
//
//  Created by Osman Emre Ömürlü on 25.02.2024.
//

import UIKit

protocol PersonCollectionViewCellDelegate: AnyObject {
    func didTapSubscribe()
}

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var view: PersonView?
    
    weak var delegate: PersonCollectionViewCellDelegate?
    
    var item: PersonResponse? {
        didSet {
            guard let firstName = item?.firstName,
                    let lastName = item?.lastName,
                  let email = item?.email else { return }
            
            view?.set(name: "\(firstName) \(lastName)", email: email)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonCollectionViewCell {
    
    func setup() {
        guard view == nil else { return }
        view = PersonView { [weak self] in
            guard let self = self else { return }
            self.delegate?.didTapSubscribe()
        }
        
        self.contentView.addSubview(view!)
        
        NSLayoutConstraint.activate([
            view!.topAnchor.constraint(equalTo: contentView.topAnchor),
            view!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            view!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
}
