//
//  Date+Extensions.swift
//  
//
//  Created by Michael Grant on 7/25/23.
//

import Foundation

public extension Date {
    func isLessThan(_ date: Date) -> Bool {
        if timeIntervalSince(date) < date.timeIntervalSinceNow {
            return true
        } else {
            return false
        }
    }
    
    func formattedTimeString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self, to: Date()) ?? ""
    }
}
