//
//  TaskCell.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPriority: UILabel!
    
    func configure(with task: Task) {
        lblTitle.text = task.text
        lblDate.text = task.lastUpdate
        switch task.priority {
        case .high:
            lblPriority.text = "high".localized()
        case .medium:
            lblPriority.text = "medium".localized()
        case .low:
            lblPriority.text = "low".localized()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
