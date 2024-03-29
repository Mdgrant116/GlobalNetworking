//
//  NotificationModel.swift
//
//
//  Created by Michael Grant on 3/29/24.
//

import Firebase

public struct NotificationModel {
    public let id: String
    public var postID: String?
    public let displayName: String
    public let dateCreated: Timestamp
    public let type: Int
    public let userID: String
    public var post: Post?
    public var isRead: Bool
    public var isSupported: Bool? = false
    
    public init(notification: NotificationDataModel) {
        self.id = notification.id
        self.displayName = notification.displayName
        self.dateCreated = notification.dateCreated
        self.type = notification.type
        self.userID = notification.userID
        self.isRead = notification.isRead
        self.postID = notification.postID
    }
    
    public func getMessageTitle() -> String {
        switch type {
        case 0:
            return "\(displayName) rated one of your songs"
        case 1:
            return "\(displayName) commented on one of your posts"
        case 2:
            return "\(displayName) started supporting you"
        case 3:
            return "\(displayName) agreed with your feedback"
        default:
            print("This case is not accounted for")
            return ""
        }
    }
}
