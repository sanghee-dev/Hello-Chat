//
//  MessageCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct NewMessageCell: View {
    let imageName: String
    let userName: String
    let message: String
    
    var body: some View {
        VStack(spacing: 1) {
            HStack(spacing: 12) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(userName)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(message)
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
