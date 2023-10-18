//
//  AuthService.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-16.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {

    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    static let shared = AuthService()

    init() {
        Task {
            try await loadUserData()
        }
    }

    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }

    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }

    func loadUserData() async throws {
        userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {
            return
        }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }

    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }

    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {
            return
        }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }

}
