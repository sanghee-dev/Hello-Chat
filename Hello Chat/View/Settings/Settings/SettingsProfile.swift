//
//  ProfileRow.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI
import Kingfisher

struct SettingsProfile: View {
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(_ viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.user.username)
                    .font(.system(size: 18))
                    .foregroundColor(Color(.black))
                
                Text(viewModel.user.status.title)
                    .font(.system(size: 14))
                    .foregroundColor(Color(.systemGray2))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
