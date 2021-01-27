//
//  StopwatchViewModel.swift
//  Clock
//
//  Created by Duong Cuong on 1/22/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


class StopwatchEventViewModel {
    
    var stopwatchEventModel = StopwatchEventModel(hasTouchLab: false, hasTouchStart: true, hasTouchStop: false, hasTouchReset: false)
    
    var dataSource : DynamicValue<StopwatchEventModel>?
    
    
    init() {
        self.dataSource = DynamicValue<StopwatchEventModel>(stopwatchEventModel)
    }

    func resetStopWatch() {
        touchReset()
    }
    
    func touchStart() {
        self.dataSource?.value = StopwatchEventModel(hasTouchLab: true, hasTouchStart: false, hasTouchStop: true, hasTouchReset: false)
    }
    
    func touchStop() {
        self.dataSource?.value = StopwatchEventModel(hasTouchLab: false, hasTouchStart: true, hasTouchStop: false, hasTouchReset: true)
    }
    
    func touchReset() {
        self.dataSource?.value = StopwatchEventModel(hasTouchLab: false, hasTouchStart: true, hasTouchStop: false, hasTouchReset: false)
    }
    
    func touchLab() {
        self.dataSource?.value = StopwatchEventModel(hasTouchLab: true, hasTouchStart: false, hasTouchStop: true, hasTouchReset: false)
    }
    
    
}
