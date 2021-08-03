//
//  RegistrationView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack {
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
            
            Button(action: {
                viewModel.register(withEmail: email, username: username, fullname: fullname, password: password)
            }, label: {
                Text("Sign Up")
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
