//
//  FilmsViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class FilmsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    let searchField = UITextField()
    let sortTypeButton = UIButton()
    let filmsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        
        confFilmsTableView()
        //confSearchField()
        //confSortTypeButton()
        
        ///
        
        genList()
        
        ///
    }
    
    func confSearchField() {
        filmsTableView.addSubview(searchField)
        searchField.backgroundColor = .blue
        searchField.borderStyle = .roundedRect
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            searchField.trailingAnchor.constraint(equalTo: view.centerXAnchor,constant: 50)
        ])
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func confSortTypeButton() {
        filmsTableView.addSubview(sortTypeButton)
        sortTypeButton.backgroundColor = .brown
        
        NSLayoutConstraint.activate([
            sortTypeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            sortTypeButton.leadingAnchor.constraint(equalTo: searchField.trailingAnchor,constant: 5),
            sortTypeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            searchField.heightAnchor.constraint(equalTo: sortTypeButton.heightAnchor)
            
        ])
        
        sortTypeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confFilmsTableView() {
        view.addSubview(filmsTableView)
        
        NSLayoutConstraint.activate([
            filmsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filmsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filmsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            filmsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        filmsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        filmsTableView.register(FilmSubTableViewCell.self, forCellReuseIdentifier: "FilmsCellID")
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.rowHeight = 200
        filmsTableView.backgroundColor = .systemGray6

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCellID", for: indexPath) as! FilmSubTableViewCell
        
        cell.selectionStyle = .none
        cell.filmName.text = filmSource[indexPath.row].filmName
        cell.filmText.text = filmSource[indexPath.row].filmText
        cell.separatorInset = .zero

        return cell
    }
    


}
