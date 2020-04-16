//
//  Main+TableView.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

extension MainController: UITableViewDelegateAndDataSource {
    
    func setupTableView() {
        tableView.initialize(cellClass: TaskCell.self, delegate: self, dataSource: self)
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            if self.presenter.filteredTasks.isEmpty {
                self.showEmptyScreen()
            } else {
                self.hideEmptyScreen()
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: TaskCell.self)
        cell.configure(with: presenter.filteredTasks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        presenter.removeTask(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didClickedUpdateTask(at: indexPath.row)
    }
}
