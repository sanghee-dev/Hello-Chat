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
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.user.username)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                
                Text(viewModel.user.status.title)
                    .font(.system(size: 15))
                    .foregroundColor(Color(.systemGray))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
