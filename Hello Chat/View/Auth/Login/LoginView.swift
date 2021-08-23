//
//  LoginView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isIndicatorAnimating = false

    var body: some View {
        NavigationView {
            VStack {
                IntroParagraph(title1: "Hello.", title2: "Welcome Back")
                
                VStack(spacing: 28) {
                    CustomTextField(imageName: "envelope",
                                    placeholder: "Email",
                                    isSecureField: false,
                                    text: $email)
                    
                    CustomTextField(imageName: "lock",
                                    placeholder: "Password",
                                    isSecureField: true,
                                    text: $password)
                }
                .padding([.top, .leading, .trailing], 32)
                
                HStack {
                    Spacer()
                    
                    Button(action: { print("Forgot Password?") }, label: {
                            Text("Forgot Password?")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.blue)
                                .padding(.top)
                                .padding(.bottom, 16)
                                .padding(.trailing, 32)
                    })
                }
                
                CapsuleButton(text: "Sign In",
                              disabled: email.count < 5 || password.count < 6,
                              isAnimating: isIndicatorAnimating && viewModel.errorMessage == "",
                              action: {
                                    isIndicatorAnimating = true
                                    viewModel.login(withEmail: email, password: password)
                              })
                    .alert(isPresented: $viewModel.showingErrorAlert) {
                        Alert(title: Text("Error"),
                              message: Text(viewModel.errorMessage),
                              dismissButton: .cancel(Text("OK")))
                    }
                                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView()
                        .navigationBarBackButtonHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    })
                    .padding(.bottom, 32)
            }
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

