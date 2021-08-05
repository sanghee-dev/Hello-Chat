//
//  CapsuleButton.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/03.
//

import SwiftUI

struct CapsuleButton: View {
    let text: String
    let disabled: Bool
    let isAnimating: Bool
    let action: () -> Void
    
    var body: some View {
        if disabled {
            Button(action: action, label: {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 330, height: 50)
                    .background(Color(.systemGray3))
                    .clipShape(Capsule())
                    .padding()
            })
            .disabled(true)
            .padding()
            .shadow(color: Color(.systemGray6), radius: 6, x: 0.0, y: 0.0)
        } else {
            Button(action: action, label: {
                if isAnimating {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(width: 330, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                } else {
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 330, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
            })
            .disabled(false)
            .padding()
            .shadow(color: Color(.systemGray6), radius: 6, x: 0.0, y: 0.0)
        }
    }
}
