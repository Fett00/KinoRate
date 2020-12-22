//
//  RatesViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class RatesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let ratesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        confRatesTableView()
    }
    
    func confRatesTableView() {
        view.addSubview(ratesTableView)
        
        NSLayoutConstraint.activate([
            ratesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ratesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            ratesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            ratesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        ratesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        ratesTableView.register(RatesTableViewCell.self, forCellReuseIdentifier: "RatesCellID")
        ratesTableView.delegate = self
        ratesTableView.dataSource = self
        ratesTableView.rowHeight = 100
        ratesTableView.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ratesTableView.dequeueReusableCell(withIdentifier: "RatesCellID", for: indexPath) as! RatesTableViewCell
        cell.filmName.text = dataSource[indexPath.row].filmName
        cell.author.text = dataSource[indexPath.row].author
        cell.comment.text = dataSource[indexPath.row].comment
        cell.starsValue = dataSource[indexPath.row].stars
        cell.confRateCell()
        return cell
    }


}
