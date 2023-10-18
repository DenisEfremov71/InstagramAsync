//
//  SignUpJourneyView.swift
//  InstagramAsync
//
//  Created by Denis Efremov on 2023-10-14.
//

import SwiftUI

struct SignUpJourneyView<Content>: View where Content: View {
    @Environment(\.dismiss) var dismiss
    @Binding var text: String
    let title: String
    let subtitle: String
    let textFieldText: String
    let isSecureField: Bool
    let destinationView: Content

    init(
        text: Binding<String>,
        title: String,
        subtitle: String,
        textFieldText: String,
        isSecureField: Bool = false,
        @ViewBuilder destinationView: () -> Content
    ) {
        self._text = text
        self.title = title
        self.subtitle = subtitle
        self.textFieldText = textFieldText
        self.isSecureField = isSecureField
        self.destinationView = destinationView()
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text(subtitle)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            if isSecureField {
                SecureField(textFieldText, text: $text)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            } else {
                TextField(textFieldText, text: $text)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            }

            NavigationLink {
                destinationView
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    SignUpJourneyView(
        text: .constant("Text"),
        title: "Title",
        subtitle: "Subtitle",
        textFieldText: "Text Field Text"
    ) {
        EmptyView()
    }
}
