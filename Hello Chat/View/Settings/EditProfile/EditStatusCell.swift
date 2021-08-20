//
//  EditProfileCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct EditStatusCell: View {
    let text: String
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.forward")
                })
                .foregroundColor(Color(.systemGray4))
            }
            .padding([.top, .horizontal])
            
            CustomDivider(leadingSpace: 16)
        }
        .background(Color.white)
    }
}
