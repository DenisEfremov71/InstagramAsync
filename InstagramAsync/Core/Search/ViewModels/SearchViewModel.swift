//
//  SearchViewModel.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-16.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task {
            try await fetchAllUsers()
        }
    }

    func fetchAllUsers() async throws {
        DispatchQueue.main.async {
            Task {
                self.users = try await UserService.fetchAllUsers()
            }
        }
    }
}
