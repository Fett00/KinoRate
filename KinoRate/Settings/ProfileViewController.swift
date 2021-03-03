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
        view.backgroundColor = .systemGray6

        confPhoto()
        confNameLable()
        confRegistrationDate()
    }

    func confPhoto(){
        
        view.addSubview(photo)
        let photoImage = UIImage(named: "profileImage")
        //let photoImage = UIImage(named: "profileImage2")
        
        photo.image = photoImage
        
        NSLayoutConstraint.activate([
            photo.widthAnchor.constraint(equalToConstant: 160),
            photo.heightAnchor.constraint(equalToConstant: 200),
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
            nameLable.leadingAnchor.constraint(equalTo: photo.trailingAnchor,constant: 30)
        ])
        nameLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confRegistrationDate(){
        view.addSubview(registrationDate)
        registrationDate.text = "10.01.2017"
        registrationDate.textColor = .gray
        
        NSLayoutConstraint.activate([
            registrationDate.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 10),
            registrationDate.leadingAnchor.constraint(equalTo: photo.trailingAnchor,constant: 30)
        ])
        registrationDate.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
