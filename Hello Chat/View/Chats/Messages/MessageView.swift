//
//  MessageView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI
import Kingfisher

enum MessageViewConfig {
    case privateMessage
    case groupMessage
}

struct MessageView: View {
    let viewModel: MessageViewModel
    let config: MessageViewConfig
    
    var body: some View {
        HStack(alignment: .top) {
            if viewModel.isFromCurrentUser { Spacer() }
            
            if !viewModel.isFromCurrentUser && !viewModel.message.keepTalking {
                KFImage(URL(string: viewModel.message.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 1) {
                if config == .groupMessage && !viewModel.isFromCurrentUser && !viewModel.message.keepTalking {
                    Text(viewModel.message.username)
                        .foregroundColor(Color(.systemGray2))
                        .font(.system(size: 14))
                        .padding(.bottom, 2)
                }
                
                Text(viewModel.message.text)
                    .padding(12)
                    .background(viewModel.isFromCurrentUser ? Color(.systemBlue).opacity(0.2) : Color(.systemGroupedBackground))
                    .font(.system(size: viewModel.message.text.isSingleEmoji ? 24 : 15))
                    .clipShape(MessageBubble(isFromCurrentUser: viewModel.isFromCurrentUser, isBubble: !viewModel.message.keepTalking))
                    .foregroundColor(.black)
                    .padding(.leading, config == .groupMessage && !viewModel.isFromCurrentUser && viewModel.message.keepTalking ? 40 : 0)
            }
            
            if !viewModel.isFromCurrentUser { Spacer() }
        }
        .padding(.horizontal)
    }
}
