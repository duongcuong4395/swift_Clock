//
//  stopwatchView.swift
//  Clock
//
//  Created by Duong Cuong on 1/19/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class StopwatchView: UIView {
    var labButton : UIButton = {
        var labButton = UIButton()
        labButton.setTitle("Lab", for: .normal)
        return labButton
    }()
    
    var toggleStartButton : UIButton = {
        var toggleButton = UIButton()
        toggleButton.setTitle("Start", for: .normal)
        return toggleButton
    }()
    
    var counterLabel: UILabel = {
        var label = UILabel()
        label.text = "00:00:00"
        label.textColor = Themes.title_Color
        return label
    }()
    
     override init(frame: CGRect) {
       super.init(frame: frame)
        
        setupCounterLabel()
        setUpLabButton()
        setUpToggleStartButton()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setUpLabButton() {
        self.addSubview(labButton)
        
        labButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(5)
            make.bottom.equalTo(5)
        }
    }
    
    func setUpToggleStartButton() {
        self.addSubview(toggleStartButton)
        
        toggleStartButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-5)
            make.bottom.equalTo(5)
        }
    }
    
    func setupCounterLabel() {
        self.addSubview(counterLabel)
        
        counterLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
}
