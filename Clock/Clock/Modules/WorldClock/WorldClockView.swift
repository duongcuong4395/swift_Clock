//
//  WorldClockView.swift
//  Clock
//
//  Created by Duong Cuong on 30/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit

class WorldClockView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = .blue
        self.title = Title.Tab.worldClock
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // disponse of any resource that can be recreated
    }
}
