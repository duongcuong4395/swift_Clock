//
//  TabContainerView.swift
//  Clock
//
//  Created by Duong Cuong on 30/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit

class TabContainerView: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // create tab World Clock
        let tabWorldClock = WorldClockViewController()
        let tabWorldClockItem = UITabBarItem(title: Title.Tab.worldClock, image: Resource.Tab.WorldClock, selectedImage: Resource.Tab.WorldClock)
        tabWorldClock.tabBarItem = tabWorldClockItem
        
        
        // Create tab Alarm
        let tabAlarm = AlarmView()
        let tabAlarmItem = UITabBarItem(title: Title.Tab.Alarm, image: Resource.Tab.Alarm, selectedImage: Resource.Tab.Alarm)
        tabAlarm.tabBarItem = tabAlarmItem
        
        self.viewControllers = [tabWorldClock, tabAlarm]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Tab selected: \(tabBarController.selectedIndex)")
    }
}
