//
//  TabBarViewController.swift
//  CollectionViewPhotos
//
//  Created by Маша on 22.08.2021.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = MediaLibraryViewController()
        let secVC = ForYouViewController()
        let thirdVC = MainViewController()
        let fourVC = SearchViewController()
    
        firstVC.title = "Медиатека"
        secVC.title = "Для вас"
        thirdVC.title = "Альбомы"
        fourVC.title = "Поиск"
        
        self.setViewControllers([firstVC, secVC, thirdVC, fourVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["photo.fill.on.rectangle.fill", "heart.text.square.fill", "rectangle.stack.fill", "magnifyingglass"]
        for x in 0...3 {
            items[x].image = UIImage(systemName: images[x])
        }
    }
}
