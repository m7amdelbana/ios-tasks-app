//
//  UITableView+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

typealias UITableViewDelegateAndDataSource = UITableViewDelegate & UITableViewDataSource

extension UITableView {
    
    func registerHeaderNib<Cell: UITableViewHeaderFooterView>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: Cell.self))
    }
    
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<Cell: UITableViewCell>(cellClass: Cell.Type) -> Cell {
        let identifier = String(describing: cellClass.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    func initialize<Cell: UITableViewCell>(cellClass: Cell.Type, delegate: UITableViewDelegate? = nil, dataSource: UITableViewDataSource? = nil, headerView: UIView? = nil, footerView: UIView? = UIView()) {
        self.registerCellNib(cellClass: cellClass)
        self.delegate = delegate
        self.dataSource = dataSource
        self.tableHeaderView = headerView
        self.tableFooterView = footerView
    }
}

