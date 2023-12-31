//
//  ContentViewModel.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-16.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {

    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        setupSubscribers()
    }

    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            DispatchQueue.main.async {
                self?.userSession = userSession
            }
        }
        .store(in: &cancellables)

        service.$currentUser.sink { [weak self] currentUser in
            DispatchQueue.main.async {
                self?.currentUser = currentUser
            }
        }
        .store(in: &cancellables)
    }

}
