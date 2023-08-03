//
//  BlockedUser.swift
//  
//
//  Created by Michael Grant on 8/3/23.
//

import Foundation
import FirebaseFirestore

public struct BlockedUser: Identifiable, Codable {
   public let id: String
   public let dateBlocked: Timestamp
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateBlocked = "date-blocked"
    }
    
   public init(id: String, dateBlocked: Timestamp) {
        self.id = id
        self.dateBlocked = dateBlocked
    }
    
   public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.dateBlocked = try container.decode(Timestamp.self, forKey: .dateBlocked)
    }
}
