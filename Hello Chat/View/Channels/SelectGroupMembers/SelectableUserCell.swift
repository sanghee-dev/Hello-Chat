//
//  GroupMembersCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI
import Kingfisher

struct SelectableUserCell: View {
    let viewModel: SelectableUserCellViewModel
    
    var body: some View {
        VStack(spacing: 1) {
            HStack(spacing: 12) {
                KFImage(viewModel.profileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.username)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(viewModel.fullname)
                        .foregroundColor(Color(.systemGray))
                }
                
                Spacer()

                Image(systemName: viewModel.buttonSystemName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(viewModel.buttonForegroundColor)
                    .frame(width: 16, height: 16)
                    .padding(.trailing)
            }
            .frame(height: 80)
            .background(Color.white)
            
            CustomDivider(leadingSpace: 80)
        }
    }
}
