//
//  AddEmailView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-14.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        SignUpJourneyView(
            text: $viewModel.email,
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
        .environmentObject(RegistrationViewModel())
}
