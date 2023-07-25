//
//  ArticleModel.swift
//  
//
//  Created by Michael Grant on 7/25/23.
//

import Foundation

struct ArticleModel {
    
    let article: Article
    
    var id: String {
        return article.id
    }
    
    var articleTitle: String {
        return article.title.lowercased().capitalized
    }
    
    var articleAuthor: String {
        return article.articleAuthor?.capitalized ?? ""
    }
    
    var articleSubtitle: String {
        return "\(articleAuthor) • \(articleDate)"
    }
    
    var articlePhotoCredit: String {
        return article.photoCredit?.capitalized ?? ""
    }
    
    var paragraph01: String {
        return article.articleText
    }
    
    var paragraph02: String? {
        return article.paragraph02
    }
    
    var paragraph03: String? {
        return article.paragraph03
    }
    
    var articleDate: String {
        return article.dateCreated?.dateValue().formattedTimeString() ?? ""
    }
    
    var articleType: Int {
        return article.articleType
    }
    
    var articleImageURL: URL? {
        return article.articleImageUrl
    }
    
    var articleImageURLSecondary: URL? {
        return article.articleImageUrlSecondary
    }
    
    var postId: String? {
        return article.postId
    }
    
    init(article: Article) {
        self.article = article
    }
}
