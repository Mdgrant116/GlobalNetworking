//
//  PostModel.swift
//  
//
//  Created by Michael Grant on 8/3/23.
//

import Foundation
import UIKit

public class PostModel: Identifiable, Equatable, Hashable, ObservableObject {
    public static func == (lhs: PostModel, rhs: PostModel) -> Bool {
        lhs.postId == rhs.postId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(postId)
    }

    public var rating: UserRatedOptions
    
    public var post: Post
    
    public var postId: String {
        return post.id
    }
    
    public var songUrlString: String {
        return post.songURL
    }
    
    public var artistDisplayName: String {
        return post.displayName.lowercased()
    }
    
    public var artistUserId: String {
        return post.userID
    }
    
    public var songTitle: String {
        return post.songTitle.capitalized
    }
    
    public var songQuote: String {
        return  "\"\(post.songDescription ?? "")\""
    }
    
    public var genre: String {
        return post.genre
    }
    
    public var subGenre: String? {
        return post.subGenre
    }
    
    public var firstFeaturedArtistId: String? {
        return post.firstFeaturedArtistId
    }
    
    public var secondFeaturedArtistId: String? {
        return post.secondFeaturedArtistId
    }
    
    public var customStartTime: Double? {
        return post.customStartTime
    }
    
    public var isExplicit: Bool {
        return post.isExplicit
    }
    
    public var feedbackDisabled: Bool {
        return post.feedbackDisabled
    }
    
    public var headerDescription: String {
        var descriptionString = post.genre
        
        descriptionString.append(addToHeader(title: post.subGenre))
        
        if post.isExplicit {
            descriptionString.append(addToHeader(title: "E"))
        }
        
        descriptionString.append(addToHeader(title: post.dateCreated.dateValue().formattedTimeString()))

        return descriptionString
    }
    
    func addToHeader(title: String?) -> String {
        if let title = title {
            return " • \(title)"
        } else {
            return ""
        }
    }
    
    public var locals: Int
    public var nationals: Int
    public var globals: Int
    
    public var postViews: String {
        if let views = post.views {
            return "\(views)"
        } else {
            return "0"
        }
    }

    
    public var ratedCount: CGFloat {
        return CGFloat(locals) + CGFloat(nationals) + CGFloat(globals)
    }
    
    public var ratedString: String {
        return "\(locals + nationals + globals)"
    }
    
    public var appleMusicLinkString: String? {
        return post.appleMusicLink
    }
    
    @Published public var songCover: UIImage
    
    public init(
        post: Post,
        userRatedOption: UserRatedOptions = .unrated,
        locals: Int = 0,
        nationals: Int = 0,
        globals: Int = 0,
        coverImage: UIImage = UIImage()
    ) {
        self.post = post
        self.rating = userRatedOption
        self.locals = locals
        self.nationals = nationals
        self.globals = globals
        self.songCover = coverImage
    }

}

public extension PostModel {
    struct TestingVariations {
        public static let emptyPost = PostModel(post: Post.emptyPost)
    }
}
