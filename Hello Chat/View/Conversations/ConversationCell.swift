//
//  UserProfile.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ConversationCell: View {
    let imageName: String
    let userName: String
    let conversation: String
    
    var body: some View {
        VStack(spacing: 1) {
            HStack(spacing: 12) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(userName)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(conversation)
                        .foregroundColor(Color(.systemGray))
                }
                
                Spacer()
            }
            .frame(height: 80)
            .background(Color.white)
            
            CustomDivider(leadingSpace: 80)
        }
    }
}
