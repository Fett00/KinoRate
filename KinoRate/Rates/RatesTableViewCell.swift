//
//  RatesTableViewCell.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class RatesTableViewCell: UITableViewCell {
    
    // TODO: Звезды сделать по маске и заливкой цветом н заднем фоне
    let filmName = UILabel()
    let author = UILabel()
    let comment = UILabel()
    var starsValue:Int8 = 0
    var stars = UIImage()
    var starsView = UIImageView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func confRateCell(){

        starsView.image = UIImage.createFiveStarsRating(starsValue)
        
        addSubview(filmName)
        addSubview(author)
        addSubview(comment)
        addSubview(starsView)
        filmName.font = UIFont(name: "Helvetica-bold", size: 20)
        
        author.textColor = .systemGray
        
        NSLayoutConstraint.activate([
        
            filmName.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            
            comment.topAnchor.constraint(equalTo: filmName.bottomAnchor, constant: 10),
            comment.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            comment.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            author.topAnchor.constraint(greaterThanOrEqualTo: comment.bottomAnchor,constant: 10),
            author.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            author.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            
            starsView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            starsView.leadingAnchor.constraint(equalTo: filmName.trailingAnchor),
            starsView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10)
            //starsView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
        filmName.translatesAutoresizingMaskIntoConstraints = false
        
        comment.translatesAutoresizingMaskIntoConstraints = false
        
        author.translatesAutoresizingMaskIntoConstraints = false
        
        starsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
