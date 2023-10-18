//
//  EditProfileRowView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-17.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding(.leading, 16)
                    .frame(width: 100, alignment: .leading)
                TextField(placeholder, text: $text)
            }
            .font(.subheadline)
            .frame(height: 36)

            Divider()
        }
    }
}

#Preview {
    EditProfileRowView(title: "Title", placeholder: "Placeholder", text: .constant("Text"))
}
