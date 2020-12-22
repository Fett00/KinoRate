//
//  ProfileViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 15.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var photo = UIImageView()
    var nameLable = UILabel()
    var registrationDate = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        confPhoto()
        confNameLable()
        confRegistrationDate()
    }
    
    func confPhoto(){
        
        // TODO: - НЕ закончена работа с изображением фиксированной велечины
        view.addSubview(photo)
        let constantPhotoImage = UIImage(named: "profileImage")
        let photoImage = UIImage(named: "profileImage2")
        
        photo.image = photoImage

        photo.frame = CGRect(x: 0,y: 0,width: CGFloat((constantPhotoImage?.size.width)!), height: CGFloat((constantPhotoImage?.size.height)!))
        photo.backgroundColor = .blue
        

        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            photo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10)
        ])
        photo.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func confNameLable(){
        view.addSubview(nameLable)
        nameLable.text = "fett00"
        
        NSLayoutConstraint.activate([
            nameLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLable.leadingAnchor.constraint(equalTo: photo.trailingAnchor,constant: 50)
        ])
        nameLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confRegistrationDate(){
        view.addSubview(registrationDate)
        registrationDate.text = "10.01.2017"
        registrationDate.textColor = .gray
        
        NSLayoutConstraint.activate([
            registrationDate.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 10),
            registrationDate.leadingAnchor.constraint(equalTo: photo.trailingAnchor,constant: 50)
        ])
        registrationDate.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
