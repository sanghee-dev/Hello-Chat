//
//  GroupMembersCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI

struct GroupMemberCell: View {
    @State var user: User
    
    var body: some View {
        VStack(spacing: 1) {
            HStack(spacing: 12) {
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
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
