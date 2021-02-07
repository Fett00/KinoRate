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
    var starsView = [UIImageView]()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.separatorInset = .zero
        self.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func confRateCell(){

        starsView = UIImage.createFiveStarsRating2(starsValue)
        
        addSubview(filmName)
        addSubview(author)
        addSubview(comment)
        
        for i in starsView{
            addSubview(i)
        }
        
        author.textColor = .systemGray
        comment.numberOfLines = 5
        
        filmName.font = UIFont(name: "Helvetica-bold", size: 20)
        filmName.numberOfLines = 2
        filmName.lineBreakMode = .byTruncatingTail
        
        NSLayoutConstraint.activate([
        
            filmName.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            filmName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            filmName.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            filmName.heightAnchor.constraint(equalTo: filmName.heightAnchor),
            
            author.topAnchor.constraint(equalTo: filmName.bottomAnchor,constant: 10),
            author.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
        
        for i in 0..<starsView.count{
            starsView[i].topAnchor.constraint(equalTo: filmName.bottomAnchor,constant: 10).isActive = true

            if i == 0{
                starsView[i].leadingAnchor.constraint(greaterThanOrEqualTo: author.trailingAnchor,constant: 10).isActive = true
            }
            else if i == starsView.count-1{
                starsView[i].trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10).isActive = true
                starsView[i].leadingAnchor.constraint(equalTo: starsView[i-1].trailingAnchor).isActive = true
            }
            else{
                starsView[i].leadingAnchor.constraint(equalTo: starsView[i-1].trailingAnchor).isActive = true
            }
        }
        
        NSLayoutConstraint.activate([
            comment.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 10),
            comment.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            comment.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            comment.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor,constant: -10)
        ])
        
        filmName.translatesAutoresizingMaskIntoConstraints = false
        comment.translatesAutoresizingMaskIntoConstraints = false
        author.translatesAutoresizingMaskIntoConstraints = false
        
        for i in starsView{
            i.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
