//
//  PostModel.swift
//  
//
//  Created by Michael Grant on 8/3/23.
//

import Foundation

public class PostModel: ObservableObject {
    
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
        return "\(post.genre) •  \(post.dateCreated.dateValue().formattedTimeString()) "
    }
    
    public var postViews: String {
        return "\(post.views)"
    }
    
    public var localString: String {
        return "\(post.locals)"
    }
    
    public var nationalString: String {
        return "\(post.nationals)"
    }
    
    public var globalString: String {
        return "\(post.globals)"
    }
    
    public var ratedCount: CGFloat {
        return CGFloat(post.locals) + CGFloat(post.nationals) + CGFloat(post.globals)
    }
    
    public var ratedString: String {
        return "\(post.locals + post.nationals + post.globals)"
    }
    
   public init(post: Post) {
        self.post = post
    }
}
