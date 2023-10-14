//
//  MainTabView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-13.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }

            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
