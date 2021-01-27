//
//  StopwatchModel.swift
//  Clock
//
//  Created by Duong Cuong on 1/23/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


public class StopwatchModel {
    public var fractions: Int?
    public var seconds: Int?
    public var minutes: Int?
    public var counter: String?
    public var isPlaying: Bool?
    
    init(fractions: Int, seconds: Int, minutes: Int) {
        self.fractions = fractions
        self.seconds = seconds
        self.minutes = minutes
    }
}
