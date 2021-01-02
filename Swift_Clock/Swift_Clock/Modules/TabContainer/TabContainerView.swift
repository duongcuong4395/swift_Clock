//
//  TabContainerView.swift
//  Swift_Clock
//
//  Created by Duong Cuong on 29/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation
import SwiftUI

struct TabContainerView: View {
    @State private var tabContainerViewModel = TabContainerViewModel()
    
    var body: some View{
        TabView(selection: $tabContainerViewModel.selectedTab) {
            ForEach(tabContainerViewModel.TabContainerModels, id: \.self) { viewModel in
                self.tabView(for: viewModel.type)
                    .tabItem{
                        Image(systemName: viewModel.imageName)
                        Text(viewModel.title)
                }.tag(viewModel.type)
            }
        }.accentColor(.primary)
    }
    
    @ViewBuilder
    func tabView(for tabItemType: TabContainerModel.TabItemType) -> some View {
        switch tabItemType {
        case .log:
            Text("Log")
        case .challengeList:
            Text("challenge List")
        case .setting:
            Text("Setting")
        default:
            Text("Default")
        }
    }
}
