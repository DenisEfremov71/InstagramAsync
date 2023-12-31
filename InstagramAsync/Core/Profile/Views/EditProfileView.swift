//
//  EditProfileView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-17.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel

    init(user: User) {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }

                    Spacer()

                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Spacer()

                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding()

                Divider()
            }

            // edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }

                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Divider()
                        .padding(.top, 8)
                }
            }
            .padding(.vertical, 8)

            // edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }

            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
