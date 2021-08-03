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
    @ObservedObject var viewModel = AuthViewModel()
    
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
                    
                    NavigationLink(
                        destination: Text("Reset password..."),
                        label: {
                            Text("Forgot Password?")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.blue)
                                .padding(.top)
                                .padding(.trailing, 32)
                        })
                }
                
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 330, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .padding()
                .shadow(color: Color(.systemGray6), radius: 6, x: 0.0, y: 0.0)
                
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

