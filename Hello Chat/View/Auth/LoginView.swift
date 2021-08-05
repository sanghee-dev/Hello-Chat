//
//  LoginView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                
                // 에러 메세지 띄우기
                if let error = viewModel.error {
                    Text(error.localizedDescription)
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                        .padding(.horizontal, 32)
                }
                
                CapsuleButton(text: "Sign In",
                              disabled: email.count < 5 || password.count < 6,
                              isAnimating: isIndicatorAnimating && viewModel.error == nil,
                              action: {
                                    isIndicatorAnimating = true
                                    viewModel.login(withEmail: email, password: password)
                                    // 에러 코드에 따라 텍스트필드 지우기
                                    // 유저가 없다? -> 다 지우기
                                    // 비밀번호가 틀렸다? -> 비밀번호 지우기
                              })
                                
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

