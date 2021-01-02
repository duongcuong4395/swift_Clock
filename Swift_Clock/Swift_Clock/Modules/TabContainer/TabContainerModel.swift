//
//  TabContainerModel.swift
//  Swift_Clock
//
//  Created by Duong Cuong on 29/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation

struct TabContainerModel : Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case log
        case challengeList
        case setting
    }
}
