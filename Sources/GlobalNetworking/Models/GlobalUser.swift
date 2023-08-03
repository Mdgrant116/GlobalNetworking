//
//  GlobalUser.swift
//  GlobalWorld
//
//  Created by Michael Grant on 3/22/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

public struct GlobalUser: Identifiable, Hashable, Codable {
    
    /// Document ID used to identify the user.
    public var id: String
    /// The users bio and description.
    public var bio: String?
    /// Date the user joined GlobalWorld.
    public  var dateCreated: Timestamp?
    /// The display name for the user that everyone will view.
    public  var displayName: String
    /// The amount of Dues the user has.
    public  var dues: Int
    /// The users main genre.
    public  var genre: String
    /// The users sub genre.
    public  var subGenre: String?
    /// The users  reported location.
    public  var location: String?
    /// The token used to push notifications directly to the users phone.
    public  var pushIDToken: String?
    /// The first social link provided by the user.
    public  var socialLink01: String?
    /// The second social link provided by the user.
    public  var socialLink02: String?
    /// The third social link provided by the user.
    public  var socialLink03: String?
    
   public enum CodingKeys: String, CodingKey {
        case id = "id"
        case bio = "bio"
        case dateCreated = "date-created"
        case displayName = "display-name"
        case dues = "dues"
        case genre = "genre"
        case subGenre = "sub-genre"
        case location = "location"
        case pushIDToken = "push-id"
        case socialLink01 = "social-link-01"
        case socialLink02 = "social-link-02"
        case socialLink03 = "social-link-03"
    }
    
    public init(
        id: String,
        bio: String?,
        dateCreated: Timestamp?,
        displayName: String,
        dues: Int,
        genre: String,
        subGenre: String?,
        location: String?,
        pushIdToken: String?,
        socialLink01: String?,
        socialLink02: String?,
        socialLink03: String?
    ) {
        self.id = id
        self.bio = bio
        self.dateCreated = dateCreated
        self.displayName = displayName
        self.dues = dues
        self.genre = genre
        self.subGenre = subGenre
        self.location = location
        self.pushIDToken = pushIdToken
        self.socialLink01 = socialLink01
        self.socialLink02 = socialLink02
        self.socialLink03 = socialLink03
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
        self.dateCreated = try container.decodeIfPresent(Timestamp.self, forKey: .dateCreated)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.dues = try container.decode(Int.self, forKey: .dues)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.subGenre = try container.decodeIfPresent(String.self, forKey: .subGenre)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.pushIDToken = try container.decodeIfPresent(String.self, forKey: .pushIDToken)
        self.socialLink01 = try container.decodeIfPresent(String.self, forKey: .socialLink01)
        self.socialLink02 = try container.decodeIfPresent(String.self, forKey: .socialLink02)
        self.socialLink03 = try container.decodeIfPresent(String.self, forKey: .socialLink03)
    }
    
    public init(dictionary: [String: Any]) {
        self.id = dictionary[DatabaseUserField.userID] as? String ?? ""
        self.displayName = dictionary[DatabaseUserField.displayName] as? String ?? ""
        self.pushIDToken = dictionary[DatabaseUserField.pushID] as? String ?? ""
        self.genre = dictionary[DatabaseUserField.mainGenre] as? String ?? ""
        self.subGenre = dictionary[DatabaseUserField.subGenre] as? String ?? ""
        self.bio = dictionary[DatabaseUserField.bio] as? String ?? ""
        self.location = dictionary[DatabaseUserField.location] as? String ?? ""
        self.dues = dictionary[DatabaseUserField.dues] as? Int ?? 0
        self.dateCreated = dictionary[DatabaseUserField.dateCreated] as? Timestamp ?? Timestamp(date: Date())
        self.socialLink01 = dictionary[DatabaseUserField.socialLink01] as? String ?? ""
        self.socialLink02 = dictionary[DatabaseUserField.socialLink02] as? String ?? ""
        self.socialLink03 = dictionary[DatabaseUserField.socialLink03] as? String ?? ""
    }
}

public extension GlobalUser {
    
    static func custom(
        id: String = "874jHkJjsf934l",
        bio: String? = "This is a bio",
        dateCreated: Timestamp? = Timestamp(date: Date()),
        displayName: String = "Test",
        dues: Int = 116,
        genre: String = "Hip Hop",
        subGenre: String? = "Pop",
        location: String? = "Grand Rapids",
        pushIdToken: String? = "8347344385743879",
        socialLink01: String? = "https://www.keepitfreshios.com",
        socialLink02: String? = "https://www.globalworld.com",
        socialLink03: String? = "https://www.apple.com"
        
    ) -> GlobalUser {
        return GlobalUser(
            id: id,
            bio: bio,
            dateCreated: dateCreated,
            displayName: displayName,
            dues: dues,
            genre: genre,
            subGenre: subGenre,
            location: location,
            pushIdToken: pushIdToken,
            socialLink01: socialLink01,
            socialLink02: socialLink02,
            socialLink03: socialLink03
        )
    }
    
    static let fresh = GlobalUser(
        id: "CQGayLAEsLZl2heSYVIhpgzJ6Bk2",
        bio: "Creator of the Global World app",
        dateCreated: nil,
        displayName: "fresh",
        dues: 10,
        genre: "Hip Hop",
        subGenre: nil,
        location: "Grand Rapids",
        pushIdToken: nil,
        socialLink01: nil,
        socialLink02: nil,
        socialLink03: nil
    )
    
    static let jolzywel = GlobalUser(
        id: "yWhkuh1TYadT9VixrioUheRHyRn2",
        bio: "His shot at the princess",
        dateCreated: nil,
        displayName: "jolzywel",
        dues: 0,
        genre: "Hip Hop",
        subGenre: nil,
        location: "Grand Rapids",
        pushIdToken: nil,
        socialLink01: nil,
        socialLink02: nil,
        socialLink03: nil
    )
    
    static let afterPxrty = GlobalUser(
        id: "JqMq62mXCGQ7r679BPZkCbzkgZz1",
        bio: nil,
        dateCreated: nil,
        displayName: "afterpxrty",
        dues: 0,
        genre: "Hip Hop",
        subGenre: nil,
        location: nil,
        pushIdToken: nil,
        socialLink01: "https://www.globalMoneyWorld.com",
        socialLink02: nil,
        socialLink03: nil
    )
    
    static let janelleMonae = GlobalUser(
        id: "CQGayLAEsLZl2heSYVIhpgzJ6Bk2",
        bio: "The one and only Arch Android, live from Metropolis",
        dateCreated: nil,
        displayName: "Janelle_Monae",
        dues: 10,
        genre: "Pop",
        subGenre: nil,
        location: "Metropolis",
        pushIdToken: nil,
        socialLink01: nil,
        socialLink02: nil,
        socialLink03: nil
    )
    
    static func empty(id: String) -> GlobalUser {
        GlobalUser(id: id,
             bio: nil,
             dateCreated: nil,
             displayName: "",
             dues: 0,
             genre: "",
             subGenre: "",
             location: nil,
             pushIdToken: nil,
             socialLink01: nil,
             socialLink02: nil,
             socialLink03: nil
        )
    }
}

public struct DatabaseUserField {
    static let name = "name"
    static let displayName = "display-name"
    static let email = "email"
    static let mainGenre = "genre"
    static let subGenre = "sub-genre"
    
    static let providerID = "provider-id"
    static let provider = "provider"
    static let userID = "user-id"
    public static let blockedByUsers = "blocked-by-users"
    public static let blockedUsers = "blocked-users"
    
    
    static let bio = "bio"
    static let location = "location"
    static let dateBlocked = "date-blocked"
    
    static let dateCreated = "date-created"
    static let dues = "dues"
    static let pushID = "push-id"
    static let socialLink01 = "social-link-01"
    static let socialLink02 = "social-link-02"
    static let socialLink03 = "social-link-03"
}
