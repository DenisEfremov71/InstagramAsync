//
//  CurrentUserProfileView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-15.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    var posts: [Post] {
        Post.MOCK_POSTS.filter { $0.user?.username == user.username }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)

                // post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
