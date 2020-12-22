//
//  FilmsViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class FilmsViewController: UIViewController {

    let searchField = UITextField()
    let sortTypeButton = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        confSearchField()
        confSortTypeButton()
        confStackView()
        
        ///
        
        genList()
        
        ///
    }
    
    func confSearchField() {
        view.addSubview(searchField)
        searchField.backgroundColor = .blue
        searchField.borderStyle = .roundedRect
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            searchField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 50)
        ])
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func confSortTypeButton() {
        view.addSubview(sortTypeButton)
        sortTypeButton.backgroundColor = .brown
        
        NSLayoutConstraint.activate([
            sortTypeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            sortTypeButton.leadingAnchor.constraint(equalTo: searchField.trailingAnchor,constant: 5),
            sortTypeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            searchField.heightAnchor.constraint(equalTo: sortTypeButton.heightAnchor)
            
        ])
        
        sortTypeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confStackView() {
        view.addSubview(stackView)
        stackView.backgroundColor = .green
        stackView.axis = .horizontal
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchField.bottomAnchor,constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 5)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }



}
