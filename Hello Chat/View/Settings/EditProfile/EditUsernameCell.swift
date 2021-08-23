//
//  EditUsernameCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/20.
//

import SwiftUI

struct EditUsernameCell: View {
    @ObservedObject var viewModel: EditProfileViewModel
    @Binding var username: String
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                TextField(viewModel.user.username, text: $username)
                
                Spacer()
                
//                Button(
//                    action: { username = "" },
//                    label: { Image(systemName: "pencil") })
            }
            .padding()
            
            CustomDivider(leadingSpace: 16)
        }
        .background(Color.white)
    }
}
