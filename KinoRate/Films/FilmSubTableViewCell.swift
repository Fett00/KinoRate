//
//  FilmSubTableViewCell.swift
//  KinoRate
//
//  Created by Садык Мусаев on 23.12.2020.
//

import UIKit

class FilmSubTableViewCell: UITableViewCell {

    var poster = UIImageView()
    var rate = UIImageView()
    var filmName = UILabel()
    var filmText = UILabel()
    var date = UILabel()
    var director = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.backgroundColor = .systemGray6
        confCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confCell() {
//        addSubview(poster)
        addSubview(filmName)
        addSubview(filmText)
//        addSubview(rate)
//        addSubview(date)
//        addSubview(director)

        
        NSLayoutConstraint.activate([
            
            filmName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            filmName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            filmText.topAnchor.constraint(equalTo: filmName.bottomAnchor, constant: 10),
            filmText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            filmText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
            
        ])
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        filmName.translatesAutoresizingMaskIntoConstraints = false
        filmText.translatesAutoresizingMaskIntoConstraints = false
        rate.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        director.translatesAutoresizingMaskIntoConstraints = false
    }
    

}
