//
//  MessageCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI
import Kingfisher

struct NewMessageCell: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 1) {
            HStack(spacing: 12) {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(user.status)
                        .foregroundColor(Color(.systemGray))
                }
                
                Spacer()
            }
            .frame(height: 70)
            .background(Color.white)
            
            CustomDivider(leadingSpace: 76)
        }
    }
}
