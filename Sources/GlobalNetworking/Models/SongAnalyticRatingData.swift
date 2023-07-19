//
//  SongAnalyticRatingData.swift
//  
//
//  Created by Michael Grant on 7/19/23.
//

import Foundation

public struct SongAnalyticRatingData: Codable {
    
    public let rating01: Int
    public let rating02: Int
    public let rating03: Int
    public let rating04: Int
    
    enum CodingKeys: String, CodingKey {
        case rating01 = "rating-01"
        case rating02 = "rating-02"
        case rating03 = "rating-03"
        case rating04 = "rating-04"
    }
}
