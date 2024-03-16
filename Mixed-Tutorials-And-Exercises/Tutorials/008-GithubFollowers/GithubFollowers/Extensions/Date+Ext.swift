//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Osman Emre Ömürlü on 8.03.2024.
//

import Foundation

extension Date {
    
    // iOS 15 and after
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }

    // before iOS 15
//    func convertToMonthYearFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM yyyy"
//        return dateFormatter.string(from: self)
//    }
}
