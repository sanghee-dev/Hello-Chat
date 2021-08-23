//
//  RegistrationView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var isIndicatorAnimating = false
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: {})
            
            IntroParagraph(title1: "Get started.", title2: "Create your account")
            
            VStack(spacing: 28) {
                CustomTextField(imageName: "envelope",
                                placeholder: "Email",
                                isSecureField: false,
                                text: $email)
                
                CustomTextField(imageName: "person",
                                placeholder: "Username",
                                isSecureField: false,
                                text: $username)
                
                CustomTextField(imageName: "person",
                                placeholder: "Full Name",
                                isSecureField: false,
                                text: $fullname)
                
                CustomTextField(imageName: "lock",
                                placeholder: "Password",
                                isSecureField: true,
                                text: $password)
            }
            .padding([.top, .leading, .trailing], 32)

            CapsuleButton(text: "Sign Up",
                          disabled: email.count < 5 || username.count < 2 || fullname.count < 2 || password.count < 6,
                          isAnimating: isIndicatorAnimating && viewModel.errorMessage == "",
                          action: {
                            isIndicatorAnimating = true
                            viewModel.register(withEmail: email, username: username, fullname: fullname, password: password)
                          })
                .alert(isPresented: $viewModel.showingErrorAlert) {
                    Alert(title: Text("Error"),
                          message: Text(viewModel.errorMessage),
                          dismissButton: .cancel(Text("OK")))
                }
            
            Spacer()
            
            Button(action: { mode.wrappedValue.dismiss() }, label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            })
            .padding(.bottom, 32)
        }
    }
}
