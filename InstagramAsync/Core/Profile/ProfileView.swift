//
//  ProfileView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-13.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    var posts: [Post] {
        Post.MOCK_POSTS.filter { $0.user?.username == user.username }
    }

    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)

            // post grid view
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[1])
}
