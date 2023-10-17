//
//  EditProfileViewModel.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-17.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User

    @Published var fullname = ""
    @Published var bio = ""
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?

    init(user: User) {
        self.user = user
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        guard let uiImage = UIImage(data: data) else {
            return
        }
        self.profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {
        var data = [String: Any]()

        // update profile image id changed

        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }

        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }

        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}