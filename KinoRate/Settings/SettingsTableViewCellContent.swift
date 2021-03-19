
import UIKit

struct SettingsTableViewCellContent {
    
    let name:String
    let image:UIImage?
    let viewController:UIViewController?
    
    init(name: String, systemImageName: String, viewController: UIViewController?) {
        self.name = name
        self.image = UIImage(systemName: systemImageName)
        self.viewController = viewController
    }
}

let settingsCellContent = [
    SettingsTableViewCellContent(name: "Profile", systemImageName: "person", viewController: ProfileViewController()),
    SettingsTableViewCellContent(name: "Settings", systemImageName: "slider.horizontal.3", viewController: SettingsSubViewController()),
    SettingsTableViewCellContent(name: "Geo-IP", systemImageName: "map", viewController: GeoViewController()),
    SettingsTableViewCellContent(name: "About&Support", systemImageName: "info", viewController: AboutViewController())
]
