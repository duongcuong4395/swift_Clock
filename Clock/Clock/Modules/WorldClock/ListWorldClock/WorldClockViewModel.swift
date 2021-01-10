//
//  WorldClockViewModel.swift
//  Clock
//
//  Created by Duong Cuong on 30/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

 struct WorldClockViewModel {
    
    let worldClockViewModels: [WorldClockModel] = {
        let Hanoi = WorldClockModel(timeZone: "Today, +0HRS", address: "HaNoi", timeCurrent: "6:20", sessionOfDay: "PM")
        let Catanzaro = WorldClockModel(timeZone: "Today, +7HRS", address: "Catanzaro", timeCurrent: "6:20", sessionOfDay: "AM")
        
        return [Hanoi, Catanzaro]
    }()

    weak var dataSource : GenericDataSource<WorldClockModel>?

    init(dataSource : GenericDataSource<WorldClockModel>?) {
        self.dataSource = dataSource
    }

    func fetchWorldClock() {
        self.dataSource?.data.value = worldClockViewModels
    }
}


class ListWorldClockDataSource : GenericDataSource<WorldClockModel>,  UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.worldClock, for: indexPath) as! ListWorldClockCell

        let listWorldClock = self.data.value[indexPath.row]
        cell.timeZoneLabel.text = listWorldClock.timeZone
        cell.addressLabel.text = listWorldClock.address
        cell.timeCurrentLabel.text = listWorldClock.timeCurrent
        cell.sessionOfDayLabel.text = listWorldClock.sessionOfDay
    
        return cell
    }
    
}
