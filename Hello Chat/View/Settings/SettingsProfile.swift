//
//  ProfileRow.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct SettingsProfile: View {
    let imageName: String
    let personName: String
    let status: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(personName)
                    .font(.system(size: 18))
                    .foregroundColor(Color(.black))
                
                Text(status)
                    .font(.system(size: 14))
                    .foregroundColor(Color(.systemGray2))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
