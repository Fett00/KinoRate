//
//  WeatherViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 30.12.2020.
//

import UIKit


class GeoViewController: UIViewController {
    
    
    
    let geoInfoLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        confWeatherView()
        weatherFirstRespond()

    }
    
    func confWeatherView(){
        
        view.addSubview(geoInfoLable)
        
        geoInfoLable.text = "This is test text!"
        
        NSLayoutConstraint.activate([
        
            geoInfoLable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -80),
            geoInfoLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
        geoInfoLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func weatherFirstRespond(){
        
//        let apiSite = "https://api.2ip.ua/geo.json?ip=" // Вызов API с пустым параметром "ip" вернет информацию об IP адресе, с которого происходит обращение.
//
//        guard let apiUrl = URL(string: apiSite) else {return}
        
        
        
        
    }


}
