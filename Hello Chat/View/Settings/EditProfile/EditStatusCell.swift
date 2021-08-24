//
//  EditProfileCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct EditStatusCell: View {
    @ObservedObject var viewModel: EditProfileViewModel
        
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.selectedStatus?.title ?? viewModel.user.status.title)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.forward")
                })
                .foregroundColor(Color(.systemGray4))
            }
            .padding([.top, .horizontal])
            
            CustomDivider(leadingSpace: 16)
        }
        .background(Color.white)
    }
}
