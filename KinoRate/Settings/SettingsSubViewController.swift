//
//  SettingsSubViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class SettingsSubViewController: UIViewController {

    var darkModeSwitch = UISwitch()
    var darkModeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        confDarkModeSwitch()
        // Do any additional setup after loading the view.
    }
    
    func confDarkModeSwitch() {
        
        
        darkModeLabel.text = "Темный режим"
        
        view.addSubview(darkModeSwitch)
        view.addSubview(darkModeLabel)
        
        NSLayoutConstraint.activate([
            darkModeSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            darkModeSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            
            darkModeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            darkModeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        ])
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    



}
