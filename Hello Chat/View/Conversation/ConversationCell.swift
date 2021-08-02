//
//  ConversationCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ConversationCell: View {
    var isFromCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Text("HHHHHHHHHHHHHHHHHHHHHello!")
                        .padding(12)
                        .background(Color(.systemBlue))
                        .font(.system(size: 14))
                        .clipShape(ConversationBubble(isFromCurrentUser: true))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.leading, 120)
            } else {
                HStack(alignment: .bottom) {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    
                    Text("HHHHHHHHHHHHHHHHHHHHHello!")
                        .padding(12)
                        .background(Color(.systemGroupedBackground))
                        .font(.system(size: 14))
                        .clipShape(ConversationBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
            }
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell(isFromCurrentUser: true)
    }
}
