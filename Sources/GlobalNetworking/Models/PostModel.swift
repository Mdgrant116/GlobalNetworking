//
//  PostModel.swift
//  
//
//  Created by Michael Grant on 8/3/23.
//

import Foundation

public class PostModel: ObservableObject {
    public var hasBeenRatedLocal: Bool = false
    public var hasBeenRatedNational: Bool = false
    public var hasBeenRatedGlobal: Bool = false
    public var ratedByUser: Bool = false
    
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
