//
//  StopwatchModel.swift
//  Clock
//
//  Created by Duong Cuong on 1/22/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

// MARK: - StopwatchEventModel
public class StopwatchEventModel {
    public var hasTouchLab: Bool?
    public var hasTouchStart: Bool?
    public var hasTouchStop: Bool?
    public var hasTouchReset: Bool?
    
    
    
    public init(hasTouchLab: Bool, hasTouchStart: Bool, hasTouchStop: Bool, hasTouchReset: Bool) {
        self.hasTouchLab = hasTouchLab
        self.hasTouchStart = hasTouchStart
        self.hasTouchStop = hasTouchStop
        self.hasTouchReset = hasTouchReset
    }
}
