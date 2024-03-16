//
//  GFDataLoadingVC.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 11.03.2024.
//

import UIKit

class GFDataLoadingVC: UIViewController {
    
    var containerView: UIView!
    var emptyStateView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func showloadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        // let emptyStateView = GFEmptyStateView(message: message)
        hideEmptyStateView()
        emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    
    func hideEmptyStateView() {
        if let view = emptyStateView {
            view.removeFromSuperview()
        }
    }
}
