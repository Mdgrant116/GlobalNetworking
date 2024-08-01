//
//  Post.swift
//
//
//  Created by Michael Grant on 7/6/23.
//

import Firebase
import Foundation
import FirebaseFirestore

public struct Post: Identifiable, Hashable, Codable {
    public var id: String
    public var displayName: String
    public var genre: String
    public var subGenre: String?
    public var songTitle: String
    public var songDescription: String?
    public var firstFeaturedArtistId: String?
    public var secondFeaturedArtistId: String?
    public var appleMusicLink: String?
    public var songURL: String
    public var userID: String
    public var dateCreated: Timestamp
    public var views: Int? = 0
    public var customStartTime: Double?
    public var feedbackDisabled: Bool
    public var isExplicit: Bool
    
    public enum CodingKeys: String, CodingKey {
        case id = "post-id"
        case displayName = "display-name"
        case genre = "genre"
        case subGenre = "sub-genre"
        case songTitle = "song-title"
        case songDescription = "song-description"
        case firstFeaturedArtistId = "first-featured-artist-id"
        case secondFeaturedArtistId = "second-featured-artist-id"
        case appleMusicLink = "apple-music-link"
        case songURL = "song-url"
        case userID = "user-id"
        case dateCreated = "date-created"
        case customStartTime = "custom-start-time"
        case feedbackDisabled = "feedback-disabled"
        case views = "view-count"
        case isExplicit = "is-explicit"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.subGenre = try container.decodeIfPresent(String.self, forKey: .subGenre)
        self.songTitle = try container.decode(String.self, forKey: .songTitle)
        self.songDescription = try container.decodeIfPresent(String.self, forKey: .songDescription)
        self.firstFeaturedArtistId = try container.decodeIfPresent(String.self, forKey: .firstFeaturedArtistId)
        self.secondFeaturedArtistId = try container.decodeIfPresent(String.self, forKey: .secondFeaturedArtistId)
        self.appleMusicLink = try container.decodeIfPresent(String.self, forKey: .appleMusicLink)
        self.songURL = try container.decode(String.self, forKey: .songURL)
        self.userID = try container.decode(String.self, forKey: .userID)
        self.dateCreated = try container.decode(Timestamp.self, forKey: .dateCreated)
        self.customStartTime = try container.decodeIfPresent(Double.self, forKey: .customStartTime)
        self.views = try container.decodeIfPresent(Int.self, forKey: .views)
        self.feedbackDisabled = try container.decodeIfPresent(Bool.self, forKey: .feedbackDisabled) ?? false
        self.isExplicit = try container.decodeIfPresent(Bool.self, forKey: .isExplicit) ?? false
    }
    
    public init(
        id: String,
        displayName: String,
        genre: String,
        subGenre: String? = nil,
        songTitle: String,
        songDescription: String? = nil,
        firstFeaturedArtistId: String? = nil,
        secondFeaturedArtistId: String? = nil,
        appleMusicLink: String? = nil,
        songURL: String,
        userID: String,
        dateCreated: Timestamp,
        views: Int,
        customStartTime: Double? = nil,
        feedbackDisabled: Bool = true,
        isExplicit: Bool = false
    ) {
        self.id = id
        self.displayName = displayName
        self.genre = genre
        self.subGenre = subGenre
        self.songTitle = songTitle
        self.songDescription = songDescription
        self.firstFeaturedArtistId = firstFeaturedArtistId
        self.secondFeaturedArtistId = secondFeaturedArtistId
        self.appleMusicLink = appleMusicLink
        self.songURL = songURL
        self.userID = userID
        self.dateCreated = dateCreated
        self.views = views
        self.customStartTime = customStartTime
        self.feedbackDisabled = feedbackDisabled
        self.isExplicit = isExplicit
    }
    
    public init(dictionary: [String: Any]) {
        self.id = dictionary[DatabasePostField.postID] as? String ?? ""
        self.displayName = dictionary[DatabasePostField.displayName] as? String ?? ""
        self.genre = dictionary[DatabasePostField.genre] as? String ?? ""
        self.songTitle = dictionary[DatabasePostField.songTitle] as? String ?? ""
        self.songDescription = dictionary[DatabasePostField.songDescription] as? String ?? ""
        self.songURL = dictionary[DatabasePostField.songURL] as? String ?? ""
        self.userID = dictionary[DatabasePostField.userID] as? String ?? ""
        self.dateCreated = dictionary[DatabasePostField.dateCreated] as? Timestamp ?? Timestamp(date: Date())
        self.views = dictionary["view-count"] as? Int ?? 0
        self.feedbackDisabled = false
        self.isExplicit = false
    }
    
}

public extension Post {
    static let szaNightbird = Post(
        id: "iKLLvvpuBs21KYKGHmKr",
        displayName: "Sza",
        genre: Genres.rb.rawValue,
        subGenre: Genres.pop.rawValue,
        songTitle: "Nightbird",
        songDescription: "Stay the night, even if its not for real",
        songURL: "https://firebasestorage.googleapis.com/v0/b/global-world-2658f.appspot.com/o/mp3_files%2F00B898AB-EED9-419A-914A-02A22265D8AA.mp3?alt=media&token=55c614f5-3193-4143-babf-65093df47d53",
        userID: "oxOZlMjMvjNbboRwJFKSSQJQ6CJ2",
        dateCreated: Timestamp(date: Date()),
        views: 116,
        isExplicit: true
    )
    
    static let janellePhenomenal = Post(
        id: "iKLLvvpuBs21KYKGHmKr",
        displayName: "Janelle Monae",
        genre: Genres.rb.rawValue,
        songTitle: "Phenomenal",
        songDescription: "Bitch, say it to my face",
        songURL: "https://firebasestorage.googleapis.com/v0/b/global-world-2658f.appspot.com/o/mp3_files%2F00B898AB-EED9-419A-914A-02A22265D8AA.mp3?alt=media&token=55c614f5-3193-4143-babf-65093df47d53",
        userID: "oxOZlMjMvjNbboRwJFKSSQJQ6CJ2",
        dateCreated: Timestamp(date: Date()),
        views: 116
    )
    
    static let emptyPost = Post(id: "", displayName: "", genre: "", songTitle: "", songURL: "", userID: "", dateCreated: Timestamp(date: Date()), views: 0)
}

struct DatabasePostField {
    static let displayName = "display-name"
    static let userID = "user-id"
    static let dateCreated = "date-created"
    static let genre = "genre"
    static let songTitle = "song-title"
    static let songDescription = "song-description"
    static let postID = "post-id"
    static let coverArtURL = "cover-art-url"
    static let songURL = "song-url"
    static let releaseDate = "release-date"
}

enum Genres: String, CaseIterable, Identifiable, Equatable {
    case hipHop = "Hip Hop"
    case rb = "R&B"
    case pop = "Pop"
    case rock = "Rock"
    case rap = "Rap"
    case christian = "Christian"
    case edm = "EDM"
    case electronic = "Electronic"
    case country = "Country"
    case alternative = "Alternative"
    case dance = "Dance"
    case latin = "Latin"
    
    
    var id: String { self.rawValue }
    
    var index: Self.AllCases.Index? {
        return Self.allCases.firstIndex { self == $0 }
    }
    
    var image: String {
        switch self {
        case .hipHop:
            return "Genre-Hiphop"
        case .rb:
            return "Genre-R&B"
        case .pop:
            return "Gerne-Pop"
        case .rock:
            return "Genre-Rock"
        case .rap:
            return "Genre-Rap"
        case .christian:
            return "Genre-Christian"
        case .edm:
            return "Genre-EDM"
        case .electronic:
            return "Genre-Electronic"
        case .country:
            return "Genre-Country"
        case .alternative:
            return "Genre-Alternative"
        case .dance:
            return "Genre-Dance"
        case .latin:
            return "Genre-Latin"
        }
    }
}

enum SubGenres: String, CaseIterable, Identifiable {
    case none = "None"
    case hipHop = "Hip Hop"
    case rb = "R&B"
    case pop = "Pop"
    case rock = "Rock"
    case rap = "Rap"
    case christian = "Christian"
    case edm = "EDM"
    case electronic = "Electronic"
    case country = "Country"
    case alternative = "Alternative"
    case dance = "Dance"
    case latin = "Latin"
    
    
    var id: String { self.rawValue }
    
    var index: Self.AllCases.Index? {
        return Self.allCases.firstIndex { self == $0 }
    }
}
