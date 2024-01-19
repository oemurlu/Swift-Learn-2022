//
//  DetailVC.swift
//  Spotify-AutoLayout-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 17.01.2024.
//

import UIKit

class DetailVC: UIViewController {

//    private let backgroundBlurredImageView = UIImageView(image: UIImage(named: "oe-blurred"))
//    private let coverImageView = UIImageView(image: UIImage(named: "oe"))
    // Boyle yukaridaki gibi yaparsak direkt initialize etmis oluyoruz. Ama biz genelde ozellik vs eklemek istiyoz ya o yuzden asagidaki gibi acmayi daha mantikli buluyorum. mesela yukaridaki gibi acinca ".translatesAutoresizingMaskIntoConstraints=false" yapmak icin viewDidLoad'da vermek lazim. Kod karisikligi olmasin iste asagidaki gibi yap.
    
    private let backgroundBlurredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.image = UIImage(named: "blurred")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "oe")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let pagerView: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        return pageControl
    }()
    
    private let toolStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    
    private let timerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "stopwatch"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "share"), for: .normal)
        return button
    }()
    
    private let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.minimumTrackTintColor = .darkGray
        return slider
    }()
    
    private let playerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "previous"), for: .normal)
        return button
    }()
    
    private let pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pause"), for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "next"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundBlurredImageView.frame = view.frame
        view.addSubview(backgroundBlurredImageView)
        view.addSubview(coverImageView)
        view.addSubview(pagerView)
        view.addSubview(toolStackView)
        view.addSubview(slider)
        view.addSubview(playerStackView)
        
        toolStackView.addArrangedSubview(favoriteButton)
        toolStackView.addArrangedSubview(UIView())
        toolStackView.addArrangedSubview(timerButton)
        toolStackView.addArrangedSubview(UIView())
        toolStackView.addArrangedSubview(shareButton)
        
        playerStackView.addArrangedSubview(previousButton)
        playerStackView.addArrangedSubview(UIView())
        playerStackView.addArrangedSubview(pauseButton)
        playerStackView.addArrangedSubview(UIView())
        playerStackView.addArrangedSubview(nextButton)
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            coverImageView.leadingAnchor.constraint(equalTo: backgroundBlurredImageView.leadingAnchor, constant: 30),
            coverImageView.trailingAnchor.constraint(equalTo: backgroundBlurredImageView.trailingAnchor, constant: -30),
            coverImageView.heightAnchor.constraint(equalToConstant: backgroundBlurredImageView.frame.size.width - 80),
            
            pagerView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20),
            pagerView.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor),
            pagerView.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor),
            pagerView.heightAnchor.constraint(equalToConstant: 30),
            
            toolStackView.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 40),
            toolStackView.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: 20),
            toolStackView.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: -20),
            toolStackView.heightAnchor.constraint(equalToConstant: 60),
            
            slider.topAnchor.constraint(equalTo: toolStackView.bottomAnchor, constant: 30),
            slider.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: -20),
            
            playerStackView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 30),
            playerStackView.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: 20),
            playerStackView.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: -20),
            playerStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

}
