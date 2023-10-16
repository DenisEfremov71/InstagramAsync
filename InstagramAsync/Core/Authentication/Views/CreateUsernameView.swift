//
//  CreateUsernameView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-14.
//

import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        SignUpJourneyView(
            text: $viewModel.username,
            title: "Create username",
            subtitle: "Pick a username for your new account. You can always change it later.",
            textFieldText: "Username"
        ) {
            CreatePasswordView()
        }
    }
}

#Preview {
    CreateUsernameView()
        .environmentObject(RegistrationViewModel())
}
