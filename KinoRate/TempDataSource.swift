//
//  TempDataSource.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class KinoData{
    
    private var rateSource = [Rate]()
    private var filmSource = [Film]()
    private var whatSubscript:Bool
    
    var count:Int{
        if whatSubscript == true{
            return rateSource.count
        }
        else{
            return filmSource.count
        }
    }
    
    init(type:TypeOfData) {
        
        switch type {
        
        case .Rates:
            whatSubscript = true
            genRates()
            
        case .Films:
            whatSubscript = false
            genFilms()
        }
    }
    
    subscript(index:Int) -> AnyObject{
        get{
            if whatSubscript == true{
                return rateSource[index]
            }
            else{
                return filmSource[index]
            }
        }
    }
    
    enum TypeOfData {
        case Rates
        case Films
    }
    
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
        
        init(poster:UIImage,rate:UIImage,filmName:String,filmText:String,date:String) {
            self.poster =   poster
            self.rate =     rate
            self.filmName = filmName
            self.filmText = filmText
            self.date =     date
        }
    }
    
    private func genRates(){
        
        for _ in 0...Int.random(in: 400...600){
            rateSource.append(Rate(v1[Int.random(in: 0..<v1.count)], v2[Int.random(in: 0..<v2.count)], v3[Int.random(in: 0..<v3.count)], Int8.random(in: 0...5)))
        }
    }
    
    private func genFilms(){
        
        let tempLable = "Dora"
        
        for _ in 0..<20{
            filmSource.append(Film(poster: UIImage(named: "dora")!, rate: UIImage(named: "profileImage")!, filmName: tempLable, filmText: tempLable, date: tempLable))
        }
    }
    
    private var v1 = ["Форсаж","Начало","Довод","Очень,Очень,Очень,Очень большое название фильма для проверки интрефейса"," Игры","Превый","Второй","Четвертый","Пятый","Седьмой","ШЕстой","Первыв"]
    
    private var v2 = ["Отлично, все понравилось.Отлично, все понравилось.Отлично, все понравилосьОтлично, все понравилось.Отлично, все понравилось.Отлично, все понравилось","Не очень","Ужасный актерский состав","Великолепная игра актеров и все такое.Великолепная игра актеров и все такое.Великолепная игра актеров и все такоеВеликолепная игра актеров и все такое.Великолепная игра актеров и все такое.Великолепная игра актеров и все такое ","Че это","Что это за слово?","Киничик","СЫС","ыыыыы","азаз","Пропитан глубокой мысылью и серьезными духовными переживаниями","Кто пишет эти коменты?","Четко"]
    private var v3 = ["Петя Петров","Иван Иванов","Кирилл Кириллов","Никита Никитин","Владислав Владиславович","Даниил Даниилов"]
}
