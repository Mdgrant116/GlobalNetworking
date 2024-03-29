//
//  NotificationDataModel.swift
//
//
//  Created by Michael Grant on 3/29/24.
//

import Firebase

public struct NotificationDataModel: Identifiable, Hashable, Codable {
    
    // MARK: - Properties
    
    public let id: String
    public var postID: String?
    public let displayName: String
    public let dateCreated: Timestamp
    public let type: Int
    public let userID: String
    public var isRead: Bool
    
    // MARK: -  Decoder
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.postID = try container.decodeIfPresent(String.self, forKey: .postID)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.dateCreated = try container.decode(Timestamp.self, forKey: .dateCreated)
        self.type = try container.decode(Int.self, forKey: .type)
        self.userID = try container.decode(String.self, forKey: .userID)
        self.isRead = try container.decode(Bool.self, forKey: .isRead)
    }
    
    // MARK: - Init
    
    public init(
        id: String,
        postID: String? = nil,
        displayName: String,
        dateCreated: Timestamp,
        type: Int,
        userID: String,
        isRead: Bool
    ) {
        self.id = id
        self.postID = postID
        self.displayName = displayName
        self.dateCreated = dateCreated
        self.type = type
        self.userID = userID
        self.isRead = isRead
    }
    
    // MARK: - Coding Keys
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case postID = "post-id"
        case displayName = "display-name"
        case dateCreated = "date-created"
        case type = "type"
        case userID = "user-id"
        case isRead = "is-read"
    }
}

// MARK: - Testing Variations

public extension NotificationDataModel {
    
    static let unreadNotification: NotificationDataModel = .init(
        id: "7C9F8A38-70AF-472F-8CD2-0ECC135EF1D0",
        postID: "Nd4K65gpb7bcLe2W3IFX",
        displayName: "Sza",
        dateCreated: Timestamp(date: Date()),
        type: 2,
        userID: "yWhkuh1TYadT9VixrioUheRHyRn2",
        isRead: false
    )
    
    static let readNotification: NotificationDataModel = .init(
        id: "dkfjdskljf3983jkdf",
        postID: "Nd4K65gpb7bcLe2W3IFX",
        displayName: "Sza",
        dateCreated: Timestamp(date: Date()),
        type: 2,
        userID: "yWhkuh1TYadT9VixrioUheRHyRn2",
        isRead: true
    )
    
    static let ratingNotification: NotificationDataModel = .init(
        id: "dkfjdskljf3983jkdf",
        postID: "0z2qrvCLuMwp0RQQSfBj",
        displayName: "Sza",
        dateCreated: Timestamp(date: Date()),
        type: 2,
        userID: "yWhkuh1TYadT9VixrioUheRHyRn2",
        isRead: true
    )
}
