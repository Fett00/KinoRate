//
//  FilmsCollectionViewCell.swift
//  KinoRate
//
//  Created by Садык Мусаев on 26.01.2021.
//

import UIKit

class FilmsCollectionViewCell: UICollectionViewCell {
    
    var poster = UIImageView()
    var filmName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        confCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        poster.image = nil
    }
    
    func confCell() {
        addSubview(poster)
        addSubview(filmName)

        poster.contentMode = .scaleAspectFit
        
        filmName.numberOfLines = 2
        filmName.font = .boldSystemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            
            poster.topAnchor.constraint(equalTo: self.topAnchor),
            poster.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            //poster.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            filmName.topAnchor.constraint(equalTo: poster.bottomAnchor,constant: 10),
            filmName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            filmName.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        filmName.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpCell(content:Film) {
        poster.image = content.poster
        filmName.text = content.filmName
    }
}
