//
//  FilmsCollectionViewCell.swift
//  KinoRate
//
//  Created by Садык Мусаев on 26.01.2021.
//

import UIKit

class FilmsCollectionViewCell: UICollectionViewCell {
    
    var poster = UIImageView()
    var rate = UIImageView()
    var filmName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray6
        confCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confCell() {
        addSubview(poster)
        addSubview(filmName)
        //addSubview(rate)
        
        self.backgroundColor = .systemGray5
        clipsToBounds = true
        filmName.numberOfLines = 2
        filmName.font = .boldSystemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            
            poster.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            poster.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            poster.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -70),
            //poster.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -40),
            //poster.heightAnchor.constraint(equalToConstant: 200)
            
            filmName.topAnchor.constraint(equalTo: poster.bottomAnchor,constant: 10),
            filmName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            filmName.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
//
//            rate.topAnchor.constraint(equalTo: filmName.bottomAnchor, constant: 10),
//            rate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
//            rate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        filmName.translatesAutoresizingMaskIntoConstraints = false
//        rate.translatesAutoresizingMaskIntoConstraints = false
    }
}
