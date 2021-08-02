//
//  ConversationView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ConversationView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach((0...5), id: \.self) { _ in
                        ConversationCell(isFromCurrentUser: false)
                        ConversationCell(isFromCurrentUser: true)
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("Sanghee")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        print("Send message \(messageText)")
        messageText = ""
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
