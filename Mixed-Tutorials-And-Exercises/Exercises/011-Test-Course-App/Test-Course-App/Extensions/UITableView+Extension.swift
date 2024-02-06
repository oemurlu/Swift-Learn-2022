//
//  UITableView+Extension.swift
//  Test-Course-App
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import UIKit

extension UITableView {
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
