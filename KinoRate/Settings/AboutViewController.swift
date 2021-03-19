//
//  AboutViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//






import UIKit

class AboutViewController: UIViewController {
    
    var aboutText = "Thanks for support us!\nYour help make us better.\n For donate check up our website \"Support\"\ngoogle.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        let aboutLabel = UILabel()
        aboutLabel.text = aboutText
        aboutLabel.textAlignment = .center
        aboutLabel.numberOfLines = 0
        
        view.addSubview(aboutLabel)
        
        NSLayoutConstraint.activate([
            aboutLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50),
            aboutLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            aboutLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            aboutLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)

        ])
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
