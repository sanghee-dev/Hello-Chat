//
//  ChannelCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI
import Kingfisher

struct ChannelCell: View {
    let channel: Channel
    
    var body: some View {
        NavigationLink(destination: ChannelChatView(channel)) {
            VStack(spacing: 1) {
                HStack(spacing: 12) {
                    if let imageUrl = channel.imageUrl {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                            .clipShape(Circle())
                            .padding(.leading)
                    } else {
                        Image(systemName: "person.2.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                            .clipShape(Circle())
                            .padding(.leading)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(channel.name)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text("\(channel.uids.count)")
                                .font(.system(size: 18))
                                .foregroundColor(Color(.systemGray2))
                        }
                        
                        Text(channel.lastMessage)
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
    }
}
