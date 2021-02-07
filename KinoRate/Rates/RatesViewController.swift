//
//  RatesViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit


class RatesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let ratesTableView = UITableView()
    let ratesSource = KinoData(type: .Rates)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        confRatesTableView()
    }
    
    func confRatesTableView() {
        view.addSubview(ratesTableView)
        
        NSLayoutConstraint.activate([
            ratesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ratesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ratesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ratesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        ratesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        ratesTableView.register(RatesTableViewCell.self, forCellReuseIdentifier: "RatesCellID")
        ratesTableView.delegate = self
        ratesTableView.dataSource = self
        ratesTableView.rowHeight = UITableView.automaticDimension//150
        ratesTableView.estimatedRowHeight = 208.5
        ratesTableView.insetsContentViewsToSafeArea = true
        ratesTableView.cellLayoutMarginsFollowReadableWidth = true
        ratesTableView.backgroundColor = .systemGray6
        ratesTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ratesSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = ratesTableView.dequeueReusableCell(withIdentifier: "RatesCellID", for: indexPath) as! RatesTableViewCell
        
        cell.filmName.text = (ratesSource[indexPath.row] as! KinoData.Rate).filmName
        cell.author.text = (ratesSource[indexPath.row] as! KinoData.Rate).author
        cell.comment.text = (ratesSource[indexPath.row] as! KinoData.Rate).comment
        cell.starsValue = (ratesSource[indexPath.row] as! KinoData.Rate).stars
        cell.confRateCell()
        
        return cell
    }
}
