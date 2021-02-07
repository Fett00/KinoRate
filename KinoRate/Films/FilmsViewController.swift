//
//  FilmsViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class FilmsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var filmsCollectionView:UICollectionView?
    let filmsSource = KinoData(type: .Films)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        
        confCollectionView()
    }
    
    func confCollectionView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: self.view.safeAreaLayoutGuide.layoutFrame.height)
        layout.estimatedItemSize = CGSize(width: 200, height: 400) //UICollectionView.layoutFittingExpandedSize
        filmsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        view.addSubview(filmsCollectionView ?? UICollectionView())
        filmsCollectionView?.backgroundColor = UIColor.systemGray6
        
        filmsCollectionView?.register(FilmsCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        filmsCollectionView?.dataSource = self
        filmsCollectionView?.delegate = self
        
        NSLayoutConstraint.activate([
            filmsCollectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            filmsCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            filmsCollectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            filmsCollectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10)
        ])
        filmsCollectionView?.translatesAutoresizingMaskIntoConstraints = false
    }
}
extension FilmsViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmsSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! FilmsCollectionViewCell
        cell.poster.image = (filmsSource[indexPath.row] as! KinoData.Film).poster
        cell.filmName.text = (filmsSource[indexPath.row] as! KinoData.Film).filmName
        
        return cell
    }
}



//,UITableViewDelegate,UITableViewDataSource {



/*
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
 
 
 */

