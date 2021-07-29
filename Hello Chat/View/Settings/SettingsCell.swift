//
//  SettingsCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct SettingsCell: View {
    let viewModel: SettingsCellViewModel
    
    var body: some View {
        VStack {
//            if id == 0 {
//                CustomDivider(leadingSpace: 0)
//            }
            
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                    .padding(6)
                    .foregroundColor(.white)
                    .background(viewModel.backgroundColor)
                    .cornerRadius(6)
                
                Text(viewModel.title)
                    .font(.system(size: 16))
                
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
