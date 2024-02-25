//
//  PersonView.swift
//  TopYoutubeChannels
//
//  Created by Osman Emre Ömürlü on 24.02.2024.
//

import UIKit

class PersonView: UIView {

    private lazy var subscribeButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Billy Bob"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "billy@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var personStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private var action: () -> ()
    
    
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }
}

private extension PersonView {
    func setup() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personStackView)
        
        personStackView.addArrangedSubview(nameLabel)
        personStackView.addArrangedSubview(emailLabel)
        personStackView.addArrangedSubview(subscribeButton)
        
        NSLayoutConstraint.activate([
            personStackView.topAnchor.constraint(equalTo: self.topAnchor),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        action()
    }
}
