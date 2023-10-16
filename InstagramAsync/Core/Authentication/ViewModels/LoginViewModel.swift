//
//  LoginViewModel.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-16.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
