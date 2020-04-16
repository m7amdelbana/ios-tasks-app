//
//  String+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(from formatter: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter.rawValue
        dateFormatter.locale = Locale(identifier: Language.EN.rawValue)
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    func displayDate() -> String  {
        guard let date = self.toDate(from: .server)?.convert(to: .monthYear) else { return "NA" }
        return date
    }
    
    func localized() -> String {
        return LOCAL.localizedString(key: self)
    }
}
