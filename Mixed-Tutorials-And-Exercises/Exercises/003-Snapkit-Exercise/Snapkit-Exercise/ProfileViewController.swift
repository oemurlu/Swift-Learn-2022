//
//  ProfileViewController.swift
//  Snapkit-Exercise
//
//  Created by Osman Emre Ömürlü on 28.03.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    let imageWidth: CGFloat = 100
    private lazy var profileImageVIew: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profilePhoto"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageWidth / 2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.8).cgColor
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Osman Emre Omurlu"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Engineer"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, roleLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var websiteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Website: oemurlu.dev"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Gender: Male"
        label.textColor = .white
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Age: 21"
        label.textColor = .white
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ageLabel, genderLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    
    private lazy var descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.textColor = .black
        textView.text = "I Am Osman Emre Omurlu. 2nd grade computer engineering student in Pamukkale University, interested in mobile technologies. Currently I'm learning iOS technologies and working hard to be software engineer."
        textView.backgroundColor = .clear
        return textView
    }()
    
    private lazy var projectLabel: UILabel = {
        let label = UILabel()
        label.text = "Projects"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 1)
        // CGFloat 0-1 arasi oluyor. 255 icin kullanmak istiyorsan mesela 50 kullancan ya => 50/255 yazarsin :))
        return label
    }()
    
    private lazy var projectImage1: UIImageView = {
        let image = UIImageView(image: UIImage(named: "movieWorldLogo.png"))
        return image
    }()
    
    private lazy var projectImage2: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bazaarBundleLogo.png"))
        return image
    }()
    
    private lazy var projectsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [projectImage1, projectImage2])
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.contentMode = .scaleAspectFill
        return stack
    }()
    
    private func setupView() {
        let backgroundImage = UIImageView(image: UIImage(named: "background.jpg"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.alpha = 1
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurView)
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        view.addSubview(titleLabel)
        view.addSubview(profileImageVIew)
        view.addSubview(nameStackView)
        view.addSubview(infoStackView)
        view.addSubview(descriptionLabel)
        view.addSubview(projectLabel)
        view.addSubview(projectsStackView)
        
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        profileImageVIew.snp.makeConstraints { make in
            make.width.height.equalTo(imageWidth)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageVIew.snp.centerY)
            make.left.equalTo(profileImageVIew.snp.right).offset(12)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageVIew.snp.bottom).offset(20)
            make.left.equalTo(profileImageVIew.snp.left)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(112)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(infoStackView.snp.bottom).offset(20)
        }
        
        projectLabel.snp.makeConstraints { make in
            make.left.equalTo(descriptionLabel.snp.left)
            make.right.equalTo(descriptionLabel.snp.right)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
        }
        
        projectsStackView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(projectLabel).inset(16)
            make.top.equalTo(projectLabel.snp.bottom).offset(20)
            make.height.equalTo(112)
        }
    }
}
