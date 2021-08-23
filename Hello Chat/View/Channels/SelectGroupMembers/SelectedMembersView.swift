//
//  SelectedMembers.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI
import Kingfisher

struct SelectedMembersView: View {
    @ObservedObject var viewModel: SelectGroupMembersViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.selectedUsers) { selectableUser in
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            KFImage(URL(string: selectableUser.user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(color: Color(.systemGray4), radius: 6, x: 0.0, y: 0.0)
                            
                            Text(selectableUser.user.username)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }.frame(width: 64)
                        
                        Button(action: {
                            viewModel.selectUser(selectableUser, isSelected: false)
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                                .foregroundColor(.white)
                                .background(Color(.gray))
                                .clipShape(Circle())
                        })
                    }
                }
            }
        }
        .animation(.spring())
        .padding()
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
    }
}

