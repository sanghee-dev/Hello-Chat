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
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    
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
                                isSecureField: true,
                                text: $username)
                
                CustomTextField(imageName: "person",
                                placeholder: "Full Name",
                                isSecureField: true,
                                text: $fullName)
                
                CustomTextField(imageName: "lock",
                                placeholder: "Password",
                                isSecureField: true,
                                text: $password)
            }
            .padding([.top, .leading, .trailing], 32)
            
            CustomCapsuleButton(text: "Sign Up")
            
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
