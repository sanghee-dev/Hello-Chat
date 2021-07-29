//
//  EditProfileCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct EditProfileCell: View {
    let text: String
    let textColor: Color
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .foregroundColor(textColor)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.forward")
                })
                .foregroundColor(Color(.systemGray4))
            }
            .padding([.top, .horizontal])
            
            CustomDivider(leadingSpace: 56)
        }
        .background(Color.white)
    }
}
