//
//  RatesViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit


class RatesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let rateDBOperations = RatesDB()
    
    var dataComments = [Comments]()
    
    let ratesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(createRate))
        
        confRatesTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateDataBase()
    }
    
    func confRatesTableView() {
        view.addSubview(ratesTableView)
                
        NSLayoutConstraint.activate([
            ratesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ratesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ratesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ratesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        ratesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        ratesTableView.register(RatesTableViewCell.self, forCellReuseIdentifier: "RatesCellID")
        ratesTableView.delegate = self
        ratesTableView.dataSource = self
        ratesTableView.rowHeight = UITableView.automaticDimension//150
        ratesTableView.estimatedRowHeight = 208.5
        ratesTableView.insetsContentViewsToSafeArea = true
        ratesTableView.cellLayoutMarginsFollowReadableWidth = true
        ratesTableView.backgroundColor = .systemGray6 // Устанавливает цвет задника для таблицы
        ratesTableView.tableFooterView = UIView() // Убирает пустые ячейки
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ratesTableView.dequeueReusableCell(withIdentifier: "RatesCellID", for: indexPath) as! RatesTableViewCell
        
        cell.setUpCell(content: dataComments[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(ShowRateNewViewController(comment: dataComments[indexPath.row]), animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    
    //deleteFromDB
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete"){ (swipeAction,view,completationHandler) in
            
            let commentToRemove = self.dataComments[indexPath.row]
            self.rateDBOperations.delete(dataForRemove: commentToRemove)
            self.updateDataBase()
        }
        
        return UISwipeActionsConfiguration(actions: [swipeAction])
    }
    
    func updateDataBase() {
        dataComments = rateDBOperations.get {
            DispatchQueue.main.async {
                self.ratesTableView.reloadData()
            }
        }
    }
    
    @objc func createRate(){
        
        navigationController?.pushViewController(CreateRateViewController(), animated: true)
    }
    
}
