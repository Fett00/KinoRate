//
//  RatesTableViewCell.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class RatesTableViewCell: UITableViewCell {
    
    let filmName = UILabel()
    let author = UILabel()
    let comment = UILabel()
    var starsValue:Int8 = 0
    var starsView = [UIImageView]()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        confRateCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confRateCell(){
        
        addSubview(filmName)
        addSubview(author)
        addSubview(comment)
        
        self.separatorInset = .zero
        self.backgroundColor = .systemGray6
        
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

            comment.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 10),
            comment.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            comment.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            comment.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor,constant: -10)
        ])
        
        
        filmName.translatesAutoresizingMaskIntoConstraints = false
        comment.translatesAutoresizingMaskIntoConstraints = false
        author.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func confStars(){
        
        starsView = UIImage.createFiveStarsRating2(starsValue)
        
        for i in starsView{
            addSubview(i)
        }
        
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
        
        for i in starsView{
            i.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    public func setUpCell(content:Comments){
        self.filmName.text = content.filmID ?? ""
        self.author.text = content.userID ?? ""
        self.comment.text = content.comment
        self.starsValue = Int8(content.rating)
        
        confStars()
    }
}
