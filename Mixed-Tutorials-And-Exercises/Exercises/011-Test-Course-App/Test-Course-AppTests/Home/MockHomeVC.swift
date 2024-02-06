//
//  MockHomeVC.swift
//  Test-Course-AppTests
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import UIKit
@testable import Test_Course_App

class MockViewController: HomeVCInterface {
    var isConfigureVCCalled = false
    var isConfigureTableViewCalled = false
    var isReloadTableViewCalled = false
    
    func configureVC() {
        isConfigureVCCalled = true
    }
    
    func configureTableView() {
        isConfigureTableViewCalled = true
    }
    
    func reloadTableViewOnMain() {
        isReloadTableViewCalled = true
    }

}
