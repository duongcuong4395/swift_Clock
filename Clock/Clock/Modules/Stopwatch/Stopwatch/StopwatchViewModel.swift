//
//  StopwatchViewModel.swift
//  Clock
//
//  Created by Duong Cuong on 1/23/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


class StopwatchViewModel {
    var timer = Timer()
    var stopwatchModel = StopwatchModel(fractions: 0, seconds: 0, minutes: 0)
    var dataSource : DynamicValue<StopwatchModel>
    init() {
        self.dataSource = DynamicValue<StopwatchModel>(stopwatchModel)
        self.dataSource.value.counter = "00:00:00"
        self.dataSource.value.isPlaying = false
        //timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    func start() {
        //timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        updateStopwatch(with: 0.01)
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        self.dataSource.value = StopwatchModel(fractions: 0, seconds: 0, minutes: 0)
        timer.invalidate()
    }
    
    @objc func UpdateTimer() {
        self.dataSource.value.fractions! += 1
        
        if self.dataSource.value.fractions == 100 {
            self.dataSource.value.fractions = 0
            self.dataSource.value.seconds! += 1
        }
        
        if self.dataSource.value.seconds == 60 {
            self.dataSource.value.seconds = 0
            self.dataSource.value.minutes! += 1
        }
        
        log(for: "UpdateTimer")
    }
    
    func updateStopwatch(with timeRepeat: TimeInterval) {
        timer = Timer(fire: Date(), interval: timeRepeat, repeats: true, block: {_ in
            self.dataSource.value.fractions! += 1
            
            if self.dataSource.value.fractions == 100 {
                self.dataSource.value.fractions = 0
                self.dataSource.value.seconds! += 1
            }
            
            if self.dataSource.value.seconds == 60 {
                self.dataSource.value.seconds = 0
                self.dataSource.value.minutes! += 1
            }
            self.dataSource.value = self.dataSource.value
            //self.log(for: "UpdateTimer")
        })
        RunLoop.current.add(timer, forMode: .default)
    }
    
    func stopwatchText() -> String {
        //log(for: "stopwatchText")
        let fracStr = (self.dataSource.value.fractions)! > 9 ? "\(self.dataSource.value.fractions ?? 0)" : "0\(self.dataSource.value.fractions ?? 0)"
        let secStr = (self.dataSource.value.seconds)! > 9 ? "\(self.dataSource.value.seconds ?? 0)" : "0\(self.dataSource.value.seconds ?? 0)"
        let minStr = (self.dataSource.value.minutes)! > 9 ? "\(self.dataSource.value.minutes ?? 0)" : "0\(self.dataSource.value.minutes ?? 0)"
        return "\(minStr):\(secStr).\(fracStr)"
    }
    
    func log(for funcName: String) {
        print("\(funcName): ", self.dataSource.value.minutes as Any, self.dataSource.value.seconds as Any, self.dataSource.value.fractions as Any)
    }
}
