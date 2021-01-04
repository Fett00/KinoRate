//
//  TempDataSource.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

var dataSource = [Rate]()
var filmSource = [Film]()

class Rate {
    var filmName = ""
    var comment = ""
    var author = ""
    var stars:Int8 = 0
    
    init(_ filmName:String,_ comment:String,_ author:String,_ stars:Int8) {
        self.filmName = filmName
        self.comment = comment
        self.author = author
        self.stars = stars
    }
}

class Film {
    var poster:UIImage
    var rate:UIImage
    var filmName:String
    var filmText:String
    var date:String
    var director:String
    
    init(poster:UIImage,rate:UIImage,filmName:String,filmText:String,date:String,director:String) {
        self.poster =   poster
        self.rate =     rate
        self.filmName = filmName
        self.filmText = filmText
        self.date =     date
        self.director = director
    }
}


func genList(){
    
    for _ in 0...Int.random(in: 5...20){
        dataSource.append(Rate(v1[Int.random(in: 0..<v1.count)], v2[Int.random(in: 0..<v2.count)], v3[Int.random(in: 0..<v3.count)], Int8.random(in: 0...5)))
    }
    
    let tempLable = "Dora & Ape"
    
    for _ in 0..<3{
        filmSource.append(Film(poster: UIImage(named: "dora")!, rate: UIImage(named: "profileImage")!, filmName: tempLable, filmText: tempLable, date: tempLable, director: tempLable))
    }

}

func createStars(count:Int8) -> UIImage {
    var resultImage:UIImage
    
    resultImage = UIImage(systemName: "star")!
    
    return resultImage
}

var v1 = ["Форсаж","Начало","Довод","Тайна Коко","Голодные Игры","Превый","Фаз","Маз","Краз","Газ","Уаз","Заз"]

var v2 = ["Отлично, все понравилось","Не очень","Ужасный актерский состав","Великолепная игра актеров и все такое ","Че это","Что это за слово?","Киничик","СЫС","ыыыыы","азаз","Пропитан глубокой мысылью и серьезными духовными переживаниями","Кто пишет эти коменты?","Четко"]
var v3 = ["Петя Петров","Иван Иванов","Аркадий Аркадиев","Ибрагим Ибрагимов","Сейт Сейтович","Кирилл Кириллов","Никита Никитин","Лер Леров","Дарий Дариев","Владислав Владиславович","Даниил Даниилов"]

