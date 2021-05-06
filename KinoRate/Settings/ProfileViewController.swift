//
//  ProfileViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 15.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var avatar = UIImageView()
    var nameLable = UILabel()
    var registrationDate = UILabel()
    var changeAvatarButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        //Настройка аватарки
        confAvatar()
        //Настройка лейбла с именем
        confNameLable()
        //Настройка лейбла с датой
        confRegistrationDate()
        //Настройка кнопки смены аватара
        confChangeAvatarButton()
    }

    func confAvatar(){
        
        view.addSubview(avatar)
        let photoImage = UIImage(named: "profileImage")
        //let photoImage = UIImage(named: "profileImage2")
        
        avatar.image = photoImage
        avatar.layer.cornerCurve = CALayerCornerCurve.continuous
        
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalToConstant: 160),
            avatar.heightAnchor.constraint(equalToConstant: 200),
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            avatar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10)
        ])
        avatar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confNameLable(){
        view.addSubview(nameLable)
        nameLable.text = "fett00"
        
        NSLayoutConstraint.activate([
            nameLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLable.leadingAnchor.constraint(equalTo: avatar.trailingAnchor,constant: 30)
        ])
        nameLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confRegistrationDate(){
        view.addSubview(registrationDate)
        registrationDate.text = "10.01.2017"
        registrationDate.textColor = .gray
        
        NSLayoutConstraint.activate([
            registrationDate.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 10),
            registrationDate.leadingAnchor.constraint(equalTo: avatar.trailingAnchor,constant: 30)
        ])
        registrationDate.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confChangeAvatarButton() {
        view.addSubview(changeAvatarButton)
        //Добавление действия на нажатие
        changeAvatarButton.addTarget(self, action: #selector(callAlert), for: .touchDown)
        
        //Настройка внешнего вида
        changeAvatarButton.setTitle("Change", for: .normal)
        changeAvatarButton.setTitleColor(.systemBlue, for: .normal)
        changeAvatarButton.backgroundColor = .systemBlue
        changeAvatarButton.setTitleColor(.white, for: .normal)
        changeAvatarButton.setTitleColor(.gray, for: .highlighted)
        changeAvatarButton.layer.cornerCurve = CALayerCornerCurve.continuous


        
        NSLayoutConstraint.activate([
            changeAvatarButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10),
            changeAvatarButton.trailingAnchor.constraint(equalTo: avatar.trailingAnchor),
            changeAvatarButton.widthAnchor.constraint(equalTo: avatar.widthAnchor)
        ])
        
        changeAvatarButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //Создание и вызов окна уведомления смены аватара
    @objc func callAlert(){
        let alert = UIAlertController(title: nil, message: "Change an avatar", preferredStyle: .alert)
        alert.addAction(.init(title: "Face", style: .default, handler: { (_) in
            self.avatar.image = UIImage(named: "profileImage")
        }))
        alert.addAction(.init(title: "Eye", style: .default, handler: { (_) in
            self.avatar.image = UIImage(named: "profileImage2")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
