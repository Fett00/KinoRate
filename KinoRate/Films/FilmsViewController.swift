//
//  FilmsViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class FilmsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var filmsCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        
        confCollectionView()
    }
    
    func confCollectionView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        filmsCollectionView = UICollectionView(frame: self.view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: layout)
        
        view.addSubview(filmsCollectionView ?? UICollectionView())
        
        filmsCollectionView?.backgroundColor = UIColor.systemGray6
        
        filmsCollectionView?.register(FilmsCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        //filmsCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
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
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! FilmsCollectionViewCell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)

        //cell.backgroundColor = .cyan
        //cell.contentView.backgroundColor = .brown
        //cell.setUpCell(content: filmsSource[indexPath.row])
        
        return cell
    }
}

