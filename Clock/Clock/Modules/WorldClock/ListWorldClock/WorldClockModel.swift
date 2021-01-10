//
//  WorldClockModel.swift
//  Clock
//
//  Created by Duong Cuong on 30/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation


// MARK: - WorldClockModel
public class WorldClockModel {
  
    public var timeZone: String?
    public var address: String?
    public var timeCurrent: String?
    public var sessionOfDay: String?
    
    public init(timeZone: String, address: String, timeCurrent: String, sessionOfDay: String) {
        self.timeZone = timeZone
        self.address = address
        self.timeCurrent = timeCurrent
        self.sessionOfDay = sessionOfDay
    }
}
