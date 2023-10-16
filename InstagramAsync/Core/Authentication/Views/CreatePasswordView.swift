//
//  CreatePasswordView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-14.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        SignUpJourneyView(
            text: $viewModel.password,
            title: "Create password",
            subtitle: "Your password must be at least 6 characters in length.",
            textFieldText: "Password",
            isSecureField: true
        ) {
            CompleteSignUpView()
        }
    }
}

#Preview {
    CreatePasswordView()
        .environmentObject(RegistrationViewModel())
}
