//
//  SettingsViewController.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let settingsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        confSettingsTableView()
    }
    
    func confSettingsTableView() {
        view.addSubview(settingsTableView)
        settingsTableView.tableFooterView = UIView()
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCellID")
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.backgroundColor = .systemGray6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsCellContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "SettingsCellID", for: indexPath)
    
        cell.backgroundColor = .systemGray6
        cell.textLabel?.text = settingsCellContent[indexPath.row].name
        cell.imageView?.image = settingsCellContent[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(settingsCellContent[indexPath.row].viewController ?? UIViewController(), animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
