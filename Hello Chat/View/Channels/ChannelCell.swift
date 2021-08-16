//
//  ChannelCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI
import Kingfisher

struct ChannelCell: View {
    var body: some View {
        NavigationLink(destination: Text("Channel chat view")) {
            VStack(spacing: 1) {
                HStack(spacing: 12) {
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Username")
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("Message")
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
}
