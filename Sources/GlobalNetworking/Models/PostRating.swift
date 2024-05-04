//
//  PostRating.swift
//
//
//  Created by Michael Grant on 5/3/24.
//

import Foundation

public struct PostRating: Codable {
    public let ratingType: Int
    
    enum CodingKeys: String, CodingKey {
        case ratingType = "rating-type"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ratingType = try container.decode(Int.self, forKey: .ratingType)
    }
}
