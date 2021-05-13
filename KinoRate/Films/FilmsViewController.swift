//
//  FilmsViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class FilmsViewController: UIViewController{
    
    var filmsCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        
        confCollectionView()
    }
    
    func confCollectionView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = .init(top: 15, left: 5, bottom: 0, right: 5)

        filmsCollectionView = UICollectionView(frame: self.view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: layout)
        filmsCollectionView?.isPagingEnabled = true
        filmsCollectionView?.showsHorizontalScrollIndicator = false
        
        view.addSubview(filmsCollectionView ?? UICollectionView())
        
        layout.itemSize = .init(width: (filmsCollectionView?.frame.width)! - 10, height: (filmsCollectionView?.frame.height)!)
        
        filmsCollectionView?.backgroundColor = .systemGray6
        
        filmsCollectionView?.register(FilmsCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        filmsCollectionView?.dataSource = self
        filmsCollectionView?.delegate = self
        
        NSLayoutConstraint.activate([
            filmsCollectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filmsCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            filmsCollectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filmsCollectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        filmsCollectionView?.translatesAutoresizingMaskIntoConstraints = false
    }
}
extension FilmsViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmsSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! FilmsCollectionViewCell
        
        cell.setUpCell(content: filmsSource[indexPath.row])
        
        return cell
    }
}

