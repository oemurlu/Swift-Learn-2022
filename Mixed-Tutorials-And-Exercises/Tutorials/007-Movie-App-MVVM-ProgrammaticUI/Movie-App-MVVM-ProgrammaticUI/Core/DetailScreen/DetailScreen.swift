//
//  DetailScreen.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 19.01.2024.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImageView()
    func configuretitleLabel()
    func configuredateLabel()
    func configureOverviewTextView()
    func configureSubViewForTextView()
}

final class DetailScreen: UIViewController {

    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    
    private let padding: CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UITextView!
    
    init(movie: MovieResult) {
        print("DetailScreen init")
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("DetailScreen deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.viewDidLayoutSubviews()
    }
}

extension DetailScreen: DetailScreenInterface {
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)

        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        
        let posterHeight = CGFloat.dHeight * 0.6
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            posterImageView.heightAnchor.constraint(equalToConstant: posterHeight),
            posterImageView.widthAnchor.constraint(equalToConstant: posterHeight / 1.5)
        ])
    }
    
    func downloadPosterImageView() {
        posterImageView.downloadImage(movie: movie)
    }
    
    func configuretitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: padding / 2),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configuredateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Release Date: \(movie._releaseDate)"
        dateLabel.font = .systemFont(ofSize: 18, weight: .medium)
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding / 2),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func configureOverviewTextView() {
        overviewLabel = UITextView(frame: .zero)
        view.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.text = movie._overview
        overviewLabel.font = .systemFont(ofSize: 20, weight: .regular)
        overviewLabel.isScrollEnabled = true
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding / 2),
            overviewLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            overviewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        ])
    }
    
    func configureSubViewForTextView() {
        overviewLabel.setContentOffset(.zero, animated: false)
    }
}
