//
//  PostService.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-18.
//

import Foundation
import Firebase

class PostService {

    private static let postCollection = Firestore.firestore().collection("posts")

    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = snapshot.documents.compactMap { try? $0.data(as: Post.self) }

        for i in 0..<posts.count {
            let ownerUid = posts[i].ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }

        return posts
    }

    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Post.self) }
    }

}
