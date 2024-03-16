//
//  GFAlertContainerView.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 11.03.2024.
//

import UIKit

final class GFAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
