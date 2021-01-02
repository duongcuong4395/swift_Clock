//
//  TabContainerViewModel.swift
//  Swift_Clock
//
//  Created by Duong Cuong on 29/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation


final class TabContainerViewModel: ObservableObject {
    @Published var selectedTab: TabContainerModel.TabItemType = .challengeList
    
    let TabContainerModels = [
        TabContainerModel(imageName: "World_Clock", title: Resource.Title.tabContainer.worldClock, type: .log),
        .init(imageName: "Alarm", title: Resource.Title.tabContainer.Alarm, type: .challengeList),
        .init(imageName: "BedTime", title: Resource.Title.tabContainer.BedTime, type: .setting)
    ]
}
