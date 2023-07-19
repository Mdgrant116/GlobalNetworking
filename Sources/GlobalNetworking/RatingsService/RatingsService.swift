//
//  RatingsService.swift
//  
//
//  Created by Michael Grant on 7/19/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FreshNetworking
import FreshLogging

public class RatingsService {
    
    public static let shared = RatingsService()
    var logger: FreshLogger = FreshLogger(category: .default(#fileID))
    
    private init() {}
    
    // MARK: - Update Local Analytics
    
    public func updateSongViewCount(
        postId: String
    ) async throws {
        let ref = DatabasePathConstants.COLLECTION_POSTS.document(postId)
        
        try await ref.updateData(
            [
                "view-count" : FieldValue.increment(Int64(1))
            ]
        )
    }
    
    public func fetchSongRatingValues(
        postId: String
    ) async throws -> SongAnalyticRatingData {
        
        let ref = DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("analytics")
        guard let data = try await ref.getDocuments(as: SongAnalyticRatingData.self).first else { throw URLError(.badURL)}
        return data
    }
    
    public func updateRatingValues(
        postId: String,
        rating01: Int,
        rating02: Int,
        rating03: Int,
        rating04: Int
    ) async throws {
        do {
            let document = try await DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("analytics").getDocuments().documents.first
            guard let documentId = document?.documentID else { throw URLError(.badURL)}
            let analyticsData = [
                SongAnalyticRatingData.CodingKeys.rating01.rawValue : FieldValue.increment(Int64(rating01)),
                SongAnalyticRatingData.CodingKeys.rating02.rawValue : FieldValue.increment(Int64(rating02)),
                SongAnalyticRatingData.CodingKeys.rating03.rawValue : FieldValue.increment(Int64(rating03)),
                SongAnalyticRatingData.CodingKeys.rating04.rawValue : FieldValue.increment(Int64(rating04)),
            ]
            
            try await DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("analytics").document(documentId).updateData(analyticsData)
            logger.default("Success updating existing ratings.")
            
        } catch  {
            logger.default("\(error)")
            logger.default("Error fetching existing rating, creating new rating.")
            
            let ref = DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("analytics").document()
            
            let analyticsData = [
                SongAnalyticRatingData.CodingKeys.rating01.rawValue : FieldValue.increment(Int64(rating01)),
                SongAnalyticRatingData.CodingKeys.rating02.rawValue : FieldValue.increment(Int64(rating02)),
                SongAnalyticRatingData.CodingKeys.rating03.rawValue : FieldValue.increment(Int64(rating03)),
                SongAnalyticRatingData.CodingKeys.rating04.rawValue : FieldValue.increment(Int64(rating04)),
            ]
            
            do {
                try await ref.setData(analyticsData)
                logger.default("Success creating new rating.")
                
            } catch  {
                logger.default("\(error)")
            }
        }
    }
}

// MARK: - Reset All Ratings

extension RatingsService {
    
    func resetAllRatings() async throws {
        let posts = try await DatabasePathConstants.COLLECTION_POSTS.getDocuments()
        
        for document in posts.documents {
            let postId = document.documentID
            
            let ratingDocument = try await DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("post-ratings").getDocuments()
            
            for document in ratingDocument.documents {
                
                try await DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("post-ratings").document(document.documentID).delete()
                print("Deleted individual analytics for song \(postId) tied to specific users.")
            }
        }
    }
    
    func resetFirstRatings() async throws {
        let posts = try await DatabasePathConstants.COLLECTION_POSTS.getDocuments()
        
        for document in posts.documents {
            let postId = document.documentID
            
            try await DatabasePathConstants.COLLECTION_POSTS.document(postId).updateData([
                "locals": 0,
                "nationals": 0,
                "globals": 0
            ])
            print("All ratings for song \(postId) reset back to zero.")
        }
    }
    
    func resetSecondRatings() async throws {
        let posts = try await DatabasePathConstants.COLLECTION_POSTS.getDocuments()
        
        for document in posts.documents {
            let postId = document.documentID
            
            do {
                let document = try? await DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("analytics").getDocuments().documents.first
                guard let documentId = document?.documentID else { throw URLError(.badURL)}
                
                do {
                    try await DatabasePathConstants.COLLECTION_POSTS.document(postId).collection("analytics").document(documentId).delete()
                } catch  {
                    print(error)
                }
            } catch  {
                print(error)
            }
            print("Deleted individual analytics for song \(postId).")
        }
    }
}

struct DatabasePathConstants {
    static let COLLECTION_USERS = Firestore.firestore().collection("users")
    static let COLLECTION_COUNTDOWN_POSTS = Firestore.firestore().collection("countdown-posts")
    static let COLLECTION_POSTS = Firestore.firestore().collection("posts")
    static let COLLECTION_GLOBAL_CONFIDENTIAL = Firestore.firestore().collection("global-confidential")
    static let COLLECTION_GLOBAL_WORLD_LIVE = Firestore.firestore().collection("global-world-live")
    static let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
    static let COLLECTION_SUPPORTERS = Firestore.firestore().collection("supporters")
    static let COLLECTION_SUPPORTING = Firestore.firestore().collection("supporting")
    static let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
    static let COLLECTION_AllUsernames = Firestore.firestore().collection("all-usernames")
}

