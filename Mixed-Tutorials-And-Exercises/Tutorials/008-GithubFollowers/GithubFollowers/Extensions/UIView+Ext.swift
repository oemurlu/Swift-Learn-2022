//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 11.03.2024.
//

import UIKit

extension UIView {
    
    func pinToEdgesOf(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }
    
    
    // this func can add multiple subviews in one line.
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}





