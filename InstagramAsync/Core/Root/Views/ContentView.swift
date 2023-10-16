//
//  ContentView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
