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
        view.backgroundColor = .white
        
        confSettingsTableView()
    }
    
    
    func confSettingsTableView() {
        view.addSubview(settingsTableView)
        settingsTableView.tableFooterView = UIView()
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCellID")
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        

        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "SettingsCellID", for: indexPath)
        let cellImage = UIImageView()
        
        if indexPath.row == 0{
            cellImage.image = UIImage(systemName: "person")
            cell.addSubview(cellImage)
            cell.textLabel?.text = "Profile"
            
            cellImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
            cellImage.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            cellImage.translatesAutoresizingMaskIntoConstraints = false
            
            cell.textLabel?.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor,constant: 10).isActive = true
            cell.textLabel?.centerYAnchor.constraint(equalTo: cellImage.centerYAnchor).isActive = true
            cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        }
        else if indexPath.row == 1 {
            cellImage.image = UIImage(systemName: "slider.horizontal.3")
            cell.addSubview(cellImage)
            cell.textLabel?.text = "Settings"
            
            cellImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
            cellImage.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            cellImage.translatesAutoresizingMaskIntoConstraints = false
            
            cell.textLabel?.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor,constant: 10).isActive = true
            cell.textLabel?.centerYAnchor.constraint(equalTo: cellImage.centerYAnchor).isActive = true
            cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
            
        }
        else if indexPath.row == 2{
            cellImage.image = UIImage(systemName: "info.circle")
            cell.addSubview(cellImage)
            cell.textLabel?.text = "About&Support"
            
            cellImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
            cellImage.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            cellImage.translatesAutoresizingMaskIntoConstraints = false
            
            cell.textLabel?.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor,constant: 10).isActive = true
            cell.textLabel?.centerYAnchor.constraint(equalTo: cellImage.centerYAnchor).isActive = true
            cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        }
        else if indexPath.row == 1{
            navigationController?.pushViewController(SettingsSubViewController(), animated: true)
        }
        else if indexPath.row == 2{
            navigationController?.pushViewController(AboutViewController(), animated: true)
        }
    }


}
