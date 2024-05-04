//
//  PostModel.swift
//  
//
//  Created by Michael Grant on 8/3/23.
//

import Foundation

public class PostModel: Identifiable, Equatable, Hashable, ObservableObject {
    public static func == (lhs: PostModel, rhs: PostModel) -> Bool {
        lhs.postId == rhs.postId
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(postId)
    }
    
    public var hasBeenRatedLocal: Bool = false
    public var hasBeenRatedNational: Bool = false
    public var hasBeenRatedGlobal: Bool = false
    public var ratedByUser: Bool = false
    
    @Published public var rating: UserRatedOptions = .unrated
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
    
    public var locals: Int = 0
    public var nationals: Int = 0
    public var globals: Int = 0
    
    public var postViews: String {
        return "\(post.views)"
    }
    
    public var localString: String {
        return "\(locals)"
    }
    
    public var nationalString: String {
        return "\(nationals)"
    }
    
    public var globalString: String {
        return "\(globals)"
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
    
    public init(
        post: Post,
        userRatedOption: UserRatedOptions = .unrated,
        locals: Int = 0,
        nationals: Int = 0,
        globals: Int = 0
    ) {
        self.post = post
        self.rating = userRatedOption
        self.locals = locals
        self.nationals = nationals
        self.globals = globals
    }

}
