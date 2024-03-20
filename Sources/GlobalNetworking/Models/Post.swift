//
//  Post.swift
//  
//
//  Created by Michael Grant on 7/6/23.
//

import Firebase
import Foundation
import FirebaseFirestoreSwift

public struct Post: Identifiable, Hashable, Codable {
    public let id: String
    public var displayName: String
    public var genre: String
    public var subGenre: String?
    public var songTitle: String
    public var songDescription: String?
    public var locals: Int
    public var nationals: Int
    public var globals: Int
    public var songURL: String
    public var userID: String
    public var dateCreated: Timestamp
    public var releaseDate: Int?
    public var ratedByUser: Bool = false
    public var hasBeenRatedLocal: Bool = false
    public var hasBeenRatedNational: Bool = false
    public var hasBeenRatedGlobal: Bool = false
    public var views: Int? = 0
    
    public enum CodingKeys: String, CodingKey {
        case id = "post-id"
        case displayName = "display-name"
        case genre = "genre"
        case subGenre = "sub-genre"
        case songTitle = "song-title"
        case songDescription = "song-description"
        case locals = "locals"
        case nationals = "nationals"
        case globals = "globals"
        case songURL = "song-url"
        case userID = "user-id"
        case dateCreated = "date-created"
        case releaseDate = "release-date"
        case ratedByUser
        case hasBeenRatedLocal
        case hasBeenRatedNational
        case hasBeenRatedGlobal
        case views = "views"
    }
    
   public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.genre = try container.decode(String.self, forKey: .genre)
       self.subGenre = try container.decodeIfPresent(String.self, forKey: .subGenre)
        self.songTitle = try container.decode(String.self, forKey: .songTitle)
        self.songDescription = try container.decodeIfPresent(String.self, forKey: .songDescription)
        self.locals = try container.decode(Int.self, forKey: .locals)
        self.nationals = try container.decode(Int.self, forKey: .nationals)
        self.globals = try container.decode(Int.self, forKey: .globals)
        self.songURL = try container.decode(String.self, forKey: .songURL)
        self.userID = try container.decode(String.self, forKey: .userID)
        self.dateCreated = try container.decode(Timestamp.self, forKey: .dateCreated)
        self.releaseDate = try container.decodeIfPresent(Int.self, forKey: .releaseDate)
        self.ratedByUser = try container.decodeIfPresent(Bool.self, forKey: .ratedByUser) ?? false
        self.hasBeenRatedLocal = try container.decodeIfPresent(Bool.self, forKey: .hasBeenRatedLocal) ?? false
        self.hasBeenRatedNational = try container.decodeIfPresent(Bool.self, forKey: .hasBeenRatedNational) ?? false
        self.hasBeenRatedGlobal = try container.decodeIfPresent(Bool.self, forKey: .hasBeenRatedGlobal) ?? false
        self.views = try container.decodeIfPresent(Int.self, forKey: .views)
    }
    
   public init(
        id: String,
        displayName: String,
        genre: String,
        subGenre: String? = nil,
        songTitle: String,
        songDescription: String? = nil,
        locals: Int,
        nationals: Int,
        globals: Int,
        songURL: String,
        userID: String,
        dateCreated: Timestamp,
        releaseDate: Int? = nil,
        ratedByUser: Bool,
        hasBeenRatedLocal: Bool,
        hasBeenRatedNational: Bool,
        hasBeenRatedGlobal: Bool,
        views: Int
    ) {
        self.id = id
        self.displayName = displayName
        self.genre = genre
        self.songTitle = songTitle
        self.songDescription = songDescription
        self.locals = locals
        self.nationals = nationals
        self.globals = globals
        self.songURL = songURL
        self.userID = userID
        self.dateCreated = dateCreated
        self.releaseDate = releaseDate
        self.ratedByUser = ratedByUser
        self.hasBeenRatedLocal = hasBeenRatedLocal
        self.hasBeenRatedNational = hasBeenRatedNational
        self.hasBeenRatedGlobal = hasBeenRatedGlobal
        self.views = views
    }
    
    public init(dictionary: [String: Any]) {
        self.id = dictionary[DatabasePostField.postID] as? String ?? ""
        self.displayName = dictionary[DatabasePostField.displayName] as? String ?? ""
        self.genre = dictionary[DatabasePostField.genre] as? String ?? ""
        self.songTitle = dictionary[DatabasePostField.songTitle] as? String ?? ""
        self.songDescription = dictionary[DatabasePostField.songDescription] as? String ?? ""
        self.locals = dictionary[DatabasePostField.locals] as? Int ?? 0
        self.nationals = dictionary[DatabasePostField.nationals] as? Int ?? 0
        self.globals = dictionary[DatabasePostField.globals] as? Int ?? 0
        self.songURL = dictionary[DatabasePostField.songURL] as? String ?? ""
        self.userID = dictionary[DatabasePostField.userID] as? String ?? ""
        self.dateCreated = dictionary[DatabasePostField.dateCreated] as? Timestamp ?? Timestamp(date: Date())
        self.views = dictionary["view-count"] as? Int ?? 0
    }
}

public extension Post {
    static let szaNightbird = Post(
        id: "iKLLvvpuBs21KYKGHmKr",
        displayName: "Sza",
        genre: Genres.rb.rawValue,
        songTitle: "Nightbird",
        songDescription: "Stay the night, even if its not for real",
        locals: 0,
        nationals: 0,
        globals: 0,
        songURL: "https://firebasestorage.googleapis.com/v0/b/global-world-2658f.appspot.com/o/mp3_files%2F00B898AB-EED9-419A-914A-02A22265D8AA.mp3?alt=media&token=55c614f5-3193-4143-babf-65093df47d53",
        userID: "oxOZlMjMvjNbboRwJFKSSQJQ6CJ2",
        dateCreated: Timestamp(date: Date()),
        ratedByUser: false,
        hasBeenRatedLocal: false,
        hasBeenRatedNational: false,
        hasBeenRatedGlobal: false,
        views: 116
    )
    
    static let janellePhenomenal = Post(
        id: "iKLLvvpuBs21KYKGHmKr",
        displayName: "Janelle Monae",
        genre: Genres.rb.rawValue,
        songTitle: "Phenomenal",
        songDescription: "Bitch, say it to my face",
        locals: 0,
        nationals: 0,
        globals: 0,
        songURL: "https://firebasestorage.googleapis.com/v0/b/global-world-2658f.appspot.com/o/mp3_files%2F00B898AB-EED9-419A-914A-02A22265D8AA.mp3?alt=media&token=55c614f5-3193-4143-babf-65093df47d53",
        userID: "oxOZlMjMvjNbboRwJFKSSQJQ6CJ2",
        dateCreated: Timestamp(date: Date()),
        ratedByUser: false,
        hasBeenRatedLocal: false,
        hasBeenRatedNational: false,
        hasBeenRatedGlobal: false,
        views: 116
    )
}

struct DatabasePostField {
    static let displayName = "display-name"
    static let userID = "user-id"
    static let dateCreated = "date-created"
    static let genre = "genre"
    static let songTitle = "song-title"
    static let songDescription = "song-description"
    static let locals = "locals"
    static let nationals = "nationals"
    static let globals = "globals"
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
