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

