//
//  Date+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case server = "yyyy-MM-dd'T'HH:mm:ssZ"
    case standard = "MM/dd/yyyy"
    case dateTime = "MM-dd-yyyy HH:mm"
    case display = "MMMM d yyyy, HH:mm a"
    case monthYear = "MMM, yyyy"
}

extension Date {
    
    func convert(to newFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat.rawValue
        return dateFormatter.string(from: self)
    }
}
