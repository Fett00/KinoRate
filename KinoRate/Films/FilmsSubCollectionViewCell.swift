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
        
        self.backgroundColor = .red
        //confCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confCell() {
        addSubview(poster)
        addSubview(filmName)
        
        filmName.backgroundColor = .brown
        
        self.backgroundColor = .systemGray6
        //clipsToBounds = true
        filmName.numberOfLines = 2
        filmName.font = .boldSystemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            
            poster.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            poster.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            //poster.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 10),
            
            filmName.topAnchor.constraint(equalTo: poster.bottomAnchor,constant: 10),
            filmName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            filmName.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
        ])
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        filmName.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpCell(content:Film) {
        self.poster.image = content.poster
        self.filmName.text = content.filmName
    }
}
