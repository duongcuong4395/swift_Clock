//
//  ListWorldClockCell.swift
//  Clock
//
//  Created by Duong Cuong on 2/1/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class WorldClockCell: UITableViewCell {
    
    let timeZoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeCurrentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sessionOfDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.worldClock)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        setupTimeZoneLabel()
        setupAddressLabel()
        setupSessionOfDayLabel()
        setupTimeCurrentLabel()
    }
    
    func setupTimeZoneLabel() {
        contentView.addSubview(timeZoneLabel)
        
        timeZoneLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(5)
            make.leading.equalTo(10)
            
        }
    }
    
    func setupAddressLabel() {
        contentView.addSubview(addressLabel)
        
        addressLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(timeZoneLabel.snp.bottom).offset(3)
            make.bottom.equalTo(-10)
            make.leading.equalTo(10)
        }
    }
    
    func setupSessionOfDayLabel() {
        contentView.addSubview(sessionOfDayLabel)
        
        sessionOfDayLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(5)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-10)
            
        }
    }
    
    func setupTimeCurrentLabel() {
        contentView.addSubview(timeCurrentLabel)
        
        timeCurrentLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(5)
            make.bottom.equalTo(-10)
            make.trailing.equalTo(sessionOfDayLabel.snp.leading).offset(1)
        }
    }
    
    
}
