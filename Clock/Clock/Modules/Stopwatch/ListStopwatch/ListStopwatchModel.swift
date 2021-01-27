//
//  ListStopwatchModel.swift
//  Clock
//
//  Created by Duong Cuong on 1/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


// MARK: - WorldClockModel
public class ListStopwatchModel {
  
    public var labName: String?
    public var labTime: String
    
    public init(labName: String, labTime: String) {
        self.labName = labName
        self.labTime = labTime
    }
}
