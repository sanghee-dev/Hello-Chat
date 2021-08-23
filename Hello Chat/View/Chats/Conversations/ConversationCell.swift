//
//  UserProfile.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCellViewModel
    
    var body: some View {
        if let chatPartner = viewModel.chatPartner {
            NavigationLink(destination: ChatsView(chatPartner: chatPartner)) {
                VStack(spacing: 1) {
                    HStack(spacing: 12) {
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                            .clipShape(Circle())
                            .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.chatPartnerUsername)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                                .foregroundColor(Color(.systemGray))
                        }
                        
                        Spacer()
                    }
                    .frame(height: 80)
                    .background(Color.white)
                    
                    CustomDivider(leadingSpace: 84)
                }
            }
            .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
        }
    }
}
