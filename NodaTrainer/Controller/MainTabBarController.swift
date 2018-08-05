//
//  MainTabBarController.swift
//  NodaTrainer
//
//  Created by sangeles on 5/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
        setupTabBar()
    }
    
    func setupTabBar() {
        /*let lectionsController = UINavigationController(rootViewController: LectionsViewController())
        lectionsController.tabBarItem.image = UIImage(named: "MENUIMG_HOME")?.withRenderingMode(.alwaysOriginal)
        lectionsController.tabBarItem.selectedImage = UIImage(named: "MENUIMG_HOMECLICKED")?.withRenderingMode(.alwaysOriginal)
        
        viewControllers![lectionsController]*/
    }
}
