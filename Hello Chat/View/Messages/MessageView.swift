//
//  MessageView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(.systemBlue))
                        .font(.system(size: 14))
                        .clipShape(MessageBubble(isFromCurrentUser: true))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.leading, 120)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(viewModel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(.systemGroupedBackground))
                        .font(.system(size: 14))
                        .clipShape(MessageBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
            }
        }
    }
}
