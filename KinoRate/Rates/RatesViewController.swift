//
//  RatesViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit


class RatesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataComments = [Comments]()
    
    let ratesTableView = UITableView()
    let ratesSource = KinoData(type: .Rates)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        updateDataBase()
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
        dataComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ratesTableView.dequeueReusableCell(withIdentifier: "RatesCellID", for: indexPath) as! RatesTableViewCell
        
        cell.filmName.text = dataComments[indexPath.row].filmID ?? ""
        cell.author.text = dataComments[indexPath.row].userID ?? ""
        cell.comment.text = dataComments[indexPath.row].comment
        cell.starsValue = Int8(dataComments[indexPath.row].rating)
        cell.confRateCell()
        
        return cell
    }
    
    
    //deleteFromDB
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete"){ (swipeAction,view,completationHandler) in
            
            let commentToRemove = self.dataComments[indexPath.row]
            
            self.context.delete(commentToRemove)
            
            do {
                try self.context.save()
            } catch  {
                
            }
            
            self.updateDataBase()
        }
        
        return UISwipeActionsConfiguration(actions: [swipeAction])
    }
    
    func updateDataBase() {
        
        do {
            dataComments = try context.fetch(Comments.fetchRequest())
            ratesTableView.reloadData()
            DispatchQueue.main.async {
                self.ratesTableView.reloadData()
            }
            
        } catch {
            return
        }
    }
    
    @objc func createRate(){
        
        navigationController?.pushViewController(CreateRateViewController(), animated: true)
    }
}
