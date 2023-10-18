//
//  FeedViewModel.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-18.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()

    init() {
        Task {
            try await fetchAllPosts()
        }
    }

    func fetchAllPosts() async throws {
        DispatchQueue.main.async {
            Task {
                self.posts = try await PostService.fetchFeedPosts()
            }
        }
    }
}
