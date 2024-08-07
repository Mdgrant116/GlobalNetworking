//
//  Article.swift
//  
//
//  Created by Michael Grant on 7/6/23.
//

import Foundation
import Firebase
import FirebaseFirestore

public struct Article: Identifiable, Hashable, Codable {
    public let id: String
    public let title: String
    public let articleText: String
    public let paragraph02: String?
    public let paragraph03: String?
    public let articleType: Int
    public let category: String?
    public let postId: String?
    public var articleImageUrl: URL?
    public var articleImageUrlSecondary: URL?
    public var dateCreated: Timestamp?
    public var photoCredit: String?
    public var articleAuthor: String?
    public var dynamicUrl: URL?
 
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case articleText = "article-paragraph-01"
        case paragraph02 = "article-paragraph-02"
        case paragraph03 = "article-paragraph-03"
        case articleType = "article-type"
        case category = "category"
        case postId = "post-id"
        case articleImageUrl = "article-image-url"
        case articleImageUrlSecondary = "article-image-url-secondary"
        case dateCreated = "date-created"
        case photoCredit = "photo-credit"
        case articleAuthor = "article-author"
        case dynamicUrl = "dynamic-url"
    }
    
   public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.articleText = try container.decode(String.self, forKey: .articleText)
        self.paragraph02 = try container.decodeIfPresent(String.self, forKey: .paragraph02)
        self.paragraph03 = try container.decodeIfPresent(String.self, forKey: .paragraph03)
        self.articleType = try container.decode(Int.self, forKey: .articleType)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.postId = try container.decodeIfPresent(String.self, forKey: .postId)
        self.articleImageUrl = try container.decodeIfPresent(URL.self, forKey: .articleImageUrl)
        self.articleImageUrlSecondary = try container.decodeIfPresent(URL.self, forKey: .articleImageUrlSecondary)
        self.dateCreated = try container.decodeIfPresent(Timestamp.self, forKey: .dateCreated)
        self.photoCredit = try container.decodeIfPresent(String.self, forKey: .photoCredit)
        self.articleAuthor = try container.decodeIfPresent(String.self, forKey: .articleAuthor)
        self.dynamicUrl = try container.decodeIfPresent(URL.self, forKey: .dynamicUrl)
    }
    
 public init(
        id: String,
        title: String,
        articleText: String,
        paragraph02: String?,
        paragraph03: String?,
        articleType: Int,
        postId: String?,
        category: String?,
        articleImageUrl: URL?,
        articleImageUrlSecondary: URL?,
        dateCreated: Timestamp,
        photoCredit: String,
        articleAuthor: String
    ) {
        self.id = id
        self.title = title
        self.articleText = articleText
        self.paragraph02 = paragraph02
        self.paragraph03 = paragraph03
        self.articleType = articleType
        self.category = category
        self.postId = postId
        self.articleImageUrl = articleImageUrl
        self.articleImageUrlSecondary = articleImageUrlSecondary
        self.dateCreated = dateCreated
        self.photoCredit = photoCredit
        self.articleAuthor = articleAuthor
    }
}

public extension Article {

    static let szaArticle = Article(
        id: "sjdhfshJKHKjh",
        title: "Sza spotted lurking with Fresh in Grand Rapids",
        articleText: "Did they fuck? Sources close to the two say yes, they sure the fuck did HHHAANNNNNNN",
        paragraph02: "But in all seriousness, I need to type a longer paragraph for testing purposes, so lets get down to business, I dont have no time to fool around, what is this.",
        paragraph03: nil,
        articleType: 0,
        postId: nil,
        category: "Hip Hop",
        articleImageUrl: URL(string: "https://media.resources.festicket.com/www/artists/Janelle.jpg"),
        articleImageUrlSecondary: nil,
        dateCreated: Timestamp(date: Date()),
        photoCredit: "Luke S. Stalker",
        articleAuthor: "Fresh"
    )
    
    static let janelleMonaeArticle = Article(
        id: "sjdhfsh116JKHKjh",
        title: "Janelle Monae, Phenomenal Review",
        articleText: "Janelle Monae is back with her new album, Age Of Pleasure. A new sound for a and entirely new Janelle. Gone are the black and white suits, actually, gone are almost all articles of clothing as she proclaims I feel better when my tits out. This is not the Janelle we used to know, but thats not a bad thing either, I myself, am as much a fan of tits as I am music.",
        paragraph02: "While Phenomenal is a departure from the sound we're used to from Janelle, fans of Arch Android will definitely notices hints of the Janelle they love throughout this piece. Phenomenal moves from verse to verse with a natural flow that will surprise you when it's over, because it's definitely not a short song.",
        paragraph03: "The most inspiring thing about this new iteration of Janelle Monae is that you can hear she's making music that gives her more joy than anything she's done before, which elevates the project more than any technical aspect of music ever could.",
        articleType: 0,
        postId: "H1qrs2zVmxt6Qt6snb5z",
        category: "Hip Hop",
        articleImageUrl: URL(string: "https://media.resources.festicket.com/www/artists/Janelle.jpg"),
        articleImageUrlSecondary: URL(string: "https://npr.brightspotcdn.com/dims4/default/084dc1f/2147483647/strip/true/crop/3647x2736+0+0/resize/880x660!/quality/90/?url=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2023%2F06%2F07%2Fmisc_23_019_jm_dsp_0269-3-0-3ff153507640790e5104733cf18e1fcd3b3bde8c.jpg"),
        dateCreated: Timestamp(date: Date()),
        photoCredit: "Luke S. Stalker",
        articleAuthor: "Fresh"
    )
    
    static let drakeMonaeArticle = Article(
        id: "sjdhfsh116JKHKjh",
        title: "Cannonball, A Look Back",
        articleText: "It’s 2008, back when mixtapes were a proving ground for an artist. Back when sites like Datpiff were still relevant instead of a breeding ground for old heads who hate any rapper born after 1980. Back when mixtapes actually gave you new songs instead of just being a collection of songs you’ve already heard. Heartbreak Drake Vol 3 just dropped.",
        paragraph02: "As you go through the track list, you see many songs you’ve heard before, but two songs stand out because you may have never seen the featured artists name before. Colin Munroe, and the two songs you’re about to be bless with is Runaway Girl, and Cannonball.",
        paragraph03: "I hope you all join me in giving Cannon Ball a listen in remembrance of one of the original Rude Boy Sad Boi anthems. Pass my Mosleys it’d all so bright, and I’m the result of when it all goes right.",
        articleType: 0,
        postId: "H1qrs2zVmxt6Qt6snb5z",
        category: "Hip Hop",
        articleImageUrl: URL(string: "https://coverartarchive.org/release/7260bf0b-c088-44c8-a49b-3ace22dafc60/2011119670.jpg"),
        articleImageUrlSecondary: URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Music116/v4/93/31/bd/9331bda4-7e19-dc80-64f8-a81db83ba8eb/196292866957.jpg/1200x1200bb.jpg"),
        dateCreated: Timestamp(date: Date()),
        photoCredit: "Luke S. Stalker",
        articleAuthor: "Fresh"
    )
}
