//
//  Supporter.swift
//
//
//  Created by Michael Grant on 9/20/23.
//

import Foundation
import FirebaseFirestore

public struct Supporter: Codable, Identifiable {
    public var id: String
    public let userId: String
    public let dateSupported: Timestamp
    
    public enum CodingKeys: String, CodingKey {
        case userId = "user-id"
        case dateSupported = "date-supported"
    }
    
    public init(userId: String, dateSupported: Timestamp) {
        self.id = userId
        self.userId = userId
        self.dateSupported = dateSupported
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id =  try container.decode(String.self, forKey: .userId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.dateSupported = try container.decode(Timestamp.self, forKey: .dateSupported)
    }
}

public extension Supporter {
     struct TestingVariations {
        public static let supporter01 = Supporter(userId: "jkdfhdsifh", dateSupported: Timestamp(date: Date()))
        public static let supporter02 = Supporter(userId: "dskjh897kjdgffj", dateSupported: Timestamp(date: Date()))
        public static let supporter03 = Supporter(userId: "98dkfnsdj74d", dateSupported: Timestamp(date: Date()))
        public static let supporter04 = Supporter(userId: "3904jkvdfkjh4", dateSupported: Timestamp(date: Date()))
        public static let supporter05 = Supporter(userId: "32kjbvbs3748f", dateSupported: Timestamp(date: Date()))
        public static let supporter06 = Supporter(userId: "09kdvnk3jngow4", dateSupported: Timestamp(date: Date()))
    }
}
