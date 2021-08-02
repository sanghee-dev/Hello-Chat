//
//  CustomInputView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                TextField("Messages...", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: action, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                })
            }
            .padding(.horizontal)
            .padding(.top, 4)
        }
    }
}
