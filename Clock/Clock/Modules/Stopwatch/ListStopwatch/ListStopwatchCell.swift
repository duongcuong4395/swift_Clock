//
//  ListStopwatchCell.swift
//  Clock
//
//  Created by Duong Cuong on 1/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ListStopwatchCell: UITableViewCell {
    var labNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Themes.text_Color
        return label
    }()
    var labTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Themes.text_Color
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.StopWatch)
        self.backgroundColor = Themes.backGround_Color
        self.initialize()
    }
    
    required init?(coder: NSCoder) {       
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        setupLabNameLabel()
        setupLabTimeLabel()
    }
    
    func setupLabNameLabel()  {
        self.contentView.addSubview(labNameLabel)
        
        labNameLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(5)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    func setupLabTimeLabel() {
        self.contentView.addSubview(labTimeLabel)
        labTimeLabel.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-5)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
