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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func confRateCell(){
        
        stars = UIImage()
        
        for _ in 0..<starsValue{
            
            stars = UIImage.mergeTwoImage(firstImage: stars, withImage: UIImage(systemName: "star.fill")!)
        }
        
        for _ in starsValue..<5{
            
            stars = UIImage.mergeTwoImage(firstImage: stars, withImage: UIImage(systemName: "star")!)

        }

        starsView.image = stars
        
        addSubview(filmName)
        addSubview(author)
        addSubview(comment)
        addSubview(starsView)
        filmName.font = UIFont(name: "Helvetica-bold", size: 20)
        
        author.textColor = .systemGray
        
        NSLayoutConstraint.activate([
        
            filmName.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            comment.topAnchor.constraint(equalTo: filmName.bottomAnchor),
            comment.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            comment.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            author.topAnchor.constraint(equalTo: comment.bottomAnchor,constant: 10),
            author.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            starsView.topAnchor.constraint(equalTo: comment.bottomAnchor,constant: 10),
            starsView.leadingAnchor.constraint(greaterThanOrEqualTo: author.trailingAnchor),
            starsView.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor)
        
        ])
        filmName.translatesAutoresizingMaskIntoConstraints = false
        
        comment.translatesAutoresizingMaskIntoConstraints = false
        
        author.translatesAutoresizingMaskIntoConstraints = false
        
        starsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
