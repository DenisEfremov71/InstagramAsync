//
//  User.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-15.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String

    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return false
        }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: nil, fullname: "Bruce Wayne", bio: "Gotham's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: nil, fullname: "Eddie Brock", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: nil, fullname: "Tony Stark", bio: "Playboy and Billionaire", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: nil, fullname: nil, bio: "Chief of Wakanda Tribe", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: nil, fullname: "Peter Parker", bio: "Good Samaritan", email: "spiderman@gmail.com")
    ]
}
