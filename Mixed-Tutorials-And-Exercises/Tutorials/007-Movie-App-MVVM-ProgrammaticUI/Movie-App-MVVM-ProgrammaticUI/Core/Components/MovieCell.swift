//
//  MovieCell.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 18.01.2024.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //bazen cell icin api'dan gelen veriler gec yukleniyo ya, hizli scroll ettigimizde reusable cell'ler karisiyo (cell'de farkli resimler filan gosteriliyo). Asagidaki prepareForReuse metodu ile birlikte bir cell reuse edilirken, cell sifirlaniyor. Boylece duzgun bir kullanim sagliyor. Scroll ederken de bizim uygulamamizda uikit sadece 3 tane cell hafizada tutuyor. 0. cell yukari gidince kayboluyor ve 3. cell yerine geciyor mesela. Boyle boyle reuse ediliyo iste. bi nevi infinite scroll mantigi da bu olmali. cunku o kadar cell'i hafizada tutarsa ram cok siser. Bu metodla iste arkaya giden (kaybolan) cell'i sifirliyoruz.
    // Ayrica cok hizli scroll ettik mesela 100 cell asagiya indik ve internet kotu, resimler yuklenmedi. mesela 100.cell civari yuklendi ama cok hizli gectigimiz kisimin resimleri arkaplanda hala indirilmeye calisiliyor. o indirilmeye calisan resimleri dataTask sayesinde durduracagiz. bu sayede verimli bir sekilde islem yapmis olacagiz.
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
//        posterImageView.translatesAutoresizingMaskIntoConstraints = false // bunu burda vermek yerine posterImage'yi initalize eder etmez yapalim bunu
        posterImageView.pinToEdgesOf(view: self)
        posterImageView.backgroundColor = .red
    }
}
