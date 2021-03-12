//
//  SceneDelegateExtansion.swift
//  KinoRate
//
//  Created by Садык Мусаев on 11.12.2020.
//

import UIKit

extension SceneDelegate{
    
    func Films() -> UIViewController {
        let flm = FilmsViewController()
        flm.tabBarItem = UITabBarItem(title: "Films", image: UIImage(systemName: "loupe"), tag: 0)
        return UINavigationController(rootViewController: flm)
    }
    func Rates() -> UIViewController {
        let rts = RatesViewController()
        rts.tabBarItem = UITabBarItem(title: "Rates", image: UIImage(systemName: "star.circle.fill"), tag: 1)
        return UINavigationController(rootViewController: rts)
    }
    func Settings() -> UIViewController {
        let sett = SettingsViewController()
        sett.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.3"), tag: 2)
        return UINavigationController(rootViewController: sett)
    }
    
    func createRootViewController() -> UIViewController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [Films(),Rates(),Settings()]
        return tabBar
    }
    
}
