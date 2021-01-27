//
//  ListStopwatchViewModel.swift
//  Clock
//
//  Created by Duong Cuong on 1/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit

class ListStopWatchViewModel {
   
    
    var stopwatchModels: [ListStopwatchModel] = {
        return []
    }()

    weak var dataSource : GenericDataSource<ListStopwatchModel>?

    init(dataSource : GenericDataSource<ListStopwatchModel>?) {
        self.dataSource = dataSource
        resetStopWatch()
    }

    func resetStopWatch() {
        self.dataSource?.data.value = stopwatchModels
    }
    
    func addStopWatch(stopwatchModel : ListStopwatchModel) {
        let hasStopwatchModel = self.dataSource!.data.value.contains { item in item.labName == stopwatchModel.labName }
        if hasStopwatchModel == false {
            self.dataSource!.data.value.append(stopwatchModel)
        }
    }
    
}


class ListStopwatchlDataSource : GenericDataSource<ListStopwatchModel>, UITableViewDataSource {
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Table.IdCell.StopWatch, for: indexPath) as! ListStopwatchCell

        let listStopWatch = self.data.value[indexPath.row]
        cell.labNameLabel.text = listStopWatch.labName
        cell.labTimeLabel.text = listStopWatch.labTime
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObjTemp = self.data.value[sourceIndexPath.item]
        self.data.value.remove(at: sourceIndexPath.item)
        self.data.value.insert(moveObjTemp, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            self.data.value.remove(at: indexPath.row)
        }
    }
}
