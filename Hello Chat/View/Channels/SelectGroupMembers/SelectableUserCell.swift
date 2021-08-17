//
//  GroupMembersCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI

struct SelectableUserCell: View {
    let selectableUser: SelectableUser
    
    var body: some View {
        VStack(spacing: 1) {
            HStack(spacing: 12) {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(selectableUser.user.username)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(selectableUser.user.fullname)
                        .foregroundColor(Color(.systemGray))
                }
                
                Spacer()

                Image(systemName: selectableUser.isSelected ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 16, height: 16)
                    .padding(.trailing)
            }
            .frame(height: 80)
            .background(Color.white)
            
            CustomDivider(leadingSpace: 80)
        }
    }
}

struct SelectableUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SelectableUserCell(selectableUser: SelectableUser(user: MOCK_USER))
    }
}
