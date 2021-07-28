//
//  CustomCapsuleButton.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI

struct CustomCapsuleButton: View {
    let text: String
    
    var body: some View {
        Button(action: {}, label: {
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 330, height: 50)
                .background(Color.blue)
                .clipShape(Capsule())
                .padding()
        })
        .padding()
        .shadow(color: Color(.systemGray2), radius: 6, x: 0.0, y: 0.0)
    }
}
