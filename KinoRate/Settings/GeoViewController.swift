//
//  WeatherViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 30.12.2020.
//

import UIKit


class GeoViewController: UIViewController {
    
    
    let geoInfoLable = UILabel()
    var jsonRespond:NSDictionary = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        confGeoView()
        geoIpRespond()
        viewJsonRespond()
    }
    
    func confGeoView(){
        
        view.addSubview(geoInfoLable)
        
        geoInfoLable.text = "This is test text!"
        
        NSLayoutConstraint.activate([
        
            geoInfoLable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -80),
            geoInfoLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        geoInfoLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func geoIpRespond(){
        //https://jsonplaceholder.typicode.com/posts/1
        //https://api.2ip.ua/geo.json?ip=
        
        guard let urlRequest = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else{ return }
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { (data, response, error) in

            if error != nil {
                print(error as Any)
                return
            }

            do {
                self.jsonRespond = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                print("---------------\n",type(of: self.jsonRespond),"\n---------------\n")
                print(self.jsonRespond)
            } catch {
                print("Error JSON serialization: \(error.localizedDescription)")
            }
        }.resume()

    }
    
    func viewJsonRespond()  {
        print(jsonRespond.allKeys)
    }
}
