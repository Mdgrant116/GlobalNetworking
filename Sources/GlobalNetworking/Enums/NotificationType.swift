//
//  NotificationType.swift
//
//
//  Created by Michael Grant on 3/29/24.
//

import Foundation

public enum NotificationType: Int, Decodable {
    case rating = 0
    case feedback = 1
    case support = 2
    case agreed = 3
    
    public var notificationMessage: String {
        switch self {
        case .rating:
            return " rated one of your songs"
        case .feedback:
            return " commented on one of your posts."
        case .support:
            return " started supporting you"
        case .agreed:
            return " agree with your feedback"
        }
    }
}
