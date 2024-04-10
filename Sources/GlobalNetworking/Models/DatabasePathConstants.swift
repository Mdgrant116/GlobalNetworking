//
//  File.swift
//  
//
//  Created by Michael Grant on 7/23/23.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

public struct DatabasePathConstants {
    static public let COLLECTION_USERS = Firestore.firestore().collection("users")
    static public let COLLECTION_COUNTDOWN_POSTS = Firestore.firestore().collection("countdown-posts")
    static public let COLLECTION_POSTS = Firestore.firestore().collection("posts")
    static public let COLLECTION_GLOBAL_CONFIDENTIAL = Firestore.firestore().collection("global-confidential")
    static public let COLLECTION_GLOBAL_WORLD_LIVE = Firestore.firestore().collection("global-world-live")
    static public let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
    static public let COLLECTION_SUPPORTERS = Firestore.firestore().collection("supporters")
    static public let COLLECTION_SUPPORTING = Firestore.firestore().collection("supporting")
    static public let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
    static public let COLLECTION_AllUsernames = Firestore.firestore().collection("all-usernames")
    
    static public let STORAGE_REF = Storage.storage().reference()
    static public let STORAGE_MP3_FILES = STORAGE_REF.child("mp3_files")

}
