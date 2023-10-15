//
//  AddEmailView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-14.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""

    var body: some View {
        SignUpJourneyView(
            text: $email,
            title: "Add your email",
            subtitle: "You'll use this email to sign in to your account.",
            textFieldText: "Email"
        ) {
            CreateUsernameView()
        }
    }
}

#Preview {
    AddEmailView()
}
