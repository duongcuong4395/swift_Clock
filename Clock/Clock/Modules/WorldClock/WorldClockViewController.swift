//
//  WorldClockView.swift
//  Clock
//
//  Created by Duong Cuong on 30/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit

class WorldClockViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = .blue
        //self.title = Title.Tab.worldClock
        
        let listWorldCockVC = ListWorldCockViewController()
        let naviListWorld = UINavigationController(rootViewController: listWorldCockVC)
        let editButton  = UIBarButtonItem(title: Title.Item.edit, style: .done, target: self, action: #selector(editAllWorldClock))
        let addButton   = UIBarButtonItem(title: Title.Item.plus, style: .done, target: self, action: #selector(addAllWorldClock))
        
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = editButton
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = addButton
        navigationController?.pushViewController(listWorldCockVC, animated: false)
    }
    
    @objc func editAllWorldClock() {
        print("click edit All World clock")
    }
    
    @objc func addAllWorldClock() {
        print("click edit All World clock")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // disponse of any resource that can be recreated
    }
}
