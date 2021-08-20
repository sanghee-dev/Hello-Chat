//
//  EditUsernameCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/20.
//

import SwiftUI

struct EditUsernameCell: View {
    @ObservedObject var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @Binding var username: String
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                TextField(viewModel.user.username, text: $username)
                                            
                Spacer()
                
                Button(action: {
                    viewModel.updateUsername(username)
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Edit")
                })
                .disabled(username.count < 2)
            }
            .padding()
            
            CustomDivider(leadingSpace: 16)
        }
        .background(Color.white)
    }
}