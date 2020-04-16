//
//  Utilities.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import SafariServices

let UTIL = Utilities.shared

class Utilities {
    
    static let shared = Utilities()
    
    func openSafari(in vc: UIViewController, with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .primary
        vc.present(safariVC, animated: true)
    }
    
    func getCurrentDate(in format: DateFormat) -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: date)
    }
    
    func share(in vc: UIViewController?, of text: String) {
        let textShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = vc?.view
        vc?.present(activityViewController, animated: true, completion: nil)
    }
}
