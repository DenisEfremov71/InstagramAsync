//
//  ContentView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM = ContentViewModel()
    @StateObject var registrationVM = RegistrationViewModel()

    var body: some View {
        Group {
            if contentVM.userSession == nil {
                LoginView()
                    .environmentObject(registrationVM)
            } else if let currentUser = contentVM.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
