//
//  StatusCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Text(status.title)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            
            CustomDivider(leadingSpace: 16)
        }
        .background(Color.white)
    }
}
