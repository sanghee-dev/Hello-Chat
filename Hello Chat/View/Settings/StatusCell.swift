//
//  StatusCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct StatusCell: View {
    let viewModel: StatusViewModel
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Text(viewModel.title)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            
            CustomDivider(leadingSpace: 16)
        }
        .background(Color.white)
    }
}
