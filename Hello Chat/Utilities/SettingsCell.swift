//
//  SettingsCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct SettingsCell: View {
    let imageName: String
    let imageBgColor: Color
    let title: String
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                    .padding(6)
                    .foregroundColor(.white)
                    .background(imageBgColor)
                    .cornerRadius(6)
                
                Text(title)
                    .font(.system(size: 16))
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.forward")
                })
                .foregroundColor(Color(.systemGray4))
            }
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading, 56)
        }
        .background(Color.white)
    }
}
