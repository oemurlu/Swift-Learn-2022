//
//  GFRepoItemVC.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 8.03.2024.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
    func didtapGitHubProfile(for user: User)
}

final class GFRepoItemVC: GFItemInfoVC {
    
    weak var delegate: GFRepoItemVCDelegate?
    
    init(user: User, delegate: GFRepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "Github Profile", systemImageName: "person")
    }
    
    
    override func actionButtonTapped() {
        delegate?.didtapGitHubProfile(for: user)
    }
}
