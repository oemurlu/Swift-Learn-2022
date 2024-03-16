//
//  UITableView+Ext.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 12.03.2024.
//

import UIKit

extension UITableView {
    
    // This func removes empty cells.
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
