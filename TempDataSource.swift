//
//  TempDataSource.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit
    
class Film {
    var poster:UIImage
    var rate:UIImage?
    var filmName:String
    var filmText:String?
    var date:String?
    
    init(poster:UIImage,rate:UIImage?,filmName:String,filmText:String?,date:String?) {
        self.poster =   poster
        self.rate =     rate
        self.filmName = filmName
        self.filmText = filmText
        self.date =     date
    }
}
    
var filmsSource = [
    
    Film(poster: UIImage(named: "dora")!, rate: nil, filmName: "Dora", filmText: nil, date: nil),
    Film(poster: UIImage(named: "led")!, rate: nil, filmName: "Led", filmText: nil, date: nil),
    Film(poster: UIImage(named: "power")!, rate: nil, filmName: "Power", filmText: nil, date: nil),
    Film(poster: UIImage(named: "dora")!, rate: nil, filmName: "Dora 2", filmText: nil, date: nil),
    Film(poster: UIImage(named: "power")!, rate: nil, filmName: "Power 4", filmText: nil, date: nil),
    Film(poster: UIImage(named: "dora")!, rate: nil, filmName: "Dora", filmText: nil, date: nil),
    Film(poster: UIImage(named: "led")!, rate: nil, filmName: "Led", filmText: nil, date: nil),
    Film(poster: UIImage(named: "power")!, rate: nil, filmName: "Power", filmText: nil, date: nil),
    Film(poster: UIImage(named: "dora")!, rate: nil, filmName: "Dora 2", filmText: nil, date: nil),
    Film(poster: UIImage(named: "power")!, rate: nil, filmName: "Power 4", filmText: nil, date: nil)
]
