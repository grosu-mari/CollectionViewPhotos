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
        let mediaLibraryViewController = MediaLibraryViewController()
        let forYouViewController = ForYouViewController()
        let mainViewController = MainViewController()
        let searchViewController = SearchViewController()
    
        mediaLibraryViewController.title = "Медиатека"
        forYouViewController.title = "Для вас"
        mainViewController.title = "Альбомы"
        searchViewController.title = "Поиск"
        
        self.setViewControllers([mediaLibraryViewController, forYouViewController, mainViewController, searchViewController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["photo.fill.on.rectangle.fill", "heart.text.square.fill", "rectangle.stack.fill", "magnifyingglass"]
        for x in 0...3 {
            items[x].image = UIImage(systemName: images[x])
        }
    }
}
