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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "SettingsCellID", for: indexPath)
        //let cellImage = UIImageView()
    
        cell.backgroundColor = .systemGray6
        //cell.addSubview(cellImage)
        switch indexPath.row{
        case 0:
            //cellImage.image = UIImage(systemName: "person")
            cell.textLabel?.text = "Profile"
            cell.imageView?.image = UIImage(systemName: "person")
        
        case 1:
            //cellImage.image = UIImage(systemName: "slider.horizontal.3")
            cell.textLabel?.text = "Settings"
            cell.imageView?.image = UIImage(systemName: "slider.horizontal.3")
        
        case 2:
            //cellImage.image = UIImage(systemName: "map")
            cell.textLabel?.text = "Geo-IP"
            cell.imageView?.image = UIImage(systemName: "map")
        
        case 3:
            //cellImage.image = UIImage(systemName: "info.circle")
            cell.textLabel?.text = "About&Support"
            cell.imageView?.image = UIImage(systemName: "info")
            
        default:
            break
        }
        /*
        NSLayoutConstraint.activate([
        
            cellImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
            cellImage.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            cell.textLabel!.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor,constant: 10),
            cell.textLabel!.centerYAnchor.constraint(equalTo: cellImage.centerYAnchor)
        ])

        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        cell.separatorInset = .init(top: 0, left: CGFloat(2*(10 + cellImage.frame.width + 10)), bottom: 0, right: 0)
         
        cell.preservesSuperviewLayoutMargins = false // разобраться что делает
        cell.layoutMargins = UIEdgeInsets.zero // разобраться что делает
         */
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(SettingsSubViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(GeoViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(AboutViewController(), animated: true)
        default:
            break
        }
    }


}
