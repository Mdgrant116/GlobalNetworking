//
//  ArticleModel.swift
//  
//
//  Created by Michael Grant on 7/25/23.
//

import Foundation

public struct ArticleModel {
    
    /// The raw unaltered article.
    public let article: Article
    
    /// The article Id.
    public var id: String {
        return article.id
    }
    
    /// The article title.
    public var articleTitle: String {
        return article.title.lowercased().capitalized
    }
    
    /// The article author.
    public var articleAuthor: String {
        return article.articleAuthor?.capitalized ?? ""
    }
    
    /// The article author and date formatted.
    public var articleSubtitle: String {
        return "\(articleAuthor) • \(articleDate)"
    }
    
    /// The photo credit for the articles image.
    public var articlePhotoCredit: String {
        return article.photoCredit?.capitalized ?? ""
    }
    
    /// The first paragraph of the article.
    public var paragraph01: String {
        return article.articleText
    }
    
    /// The second paragraph of the article.
    public var paragraph02: String? {
        return article.paragraph02
    }
    
    /// The third paragraph of the article.
    public var paragraph03: String? {
        return article.paragraph03
    }
    
    /// The formatted date of the article.
    var articleDate: String {
        return article.dateCreated?.dateValue().formattedTimeString() ?? ""
    }
    
    /// The type of article, 0: News, 1: Review.
    public var articleType: Int {
        return article.articleType
    }
    
    /// The Url for the articles primary image.
    public var articleImageURL: URL? {
        return article.articleImageUrl
    }
    
    /// The Url for the articles secondary image.
    public var articleImageURLSecondary: URL? {
        return article.articleImageUrlSecondary
    }
    
    /// The Id for the reviews Post.
    public var postId: String? {
        return article.postId
    }
    
    /// Init.
    /// - Parameter article: The unaltered article.
    public init(article: Article) {
        self.article = article
    }
}
