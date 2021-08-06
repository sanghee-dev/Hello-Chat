//
//  ChatsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ChatsView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatsViewModel
    private let chatPartner: User
    
    init(chatPartner: User) {
        self.chatPartner = chatPartner
        self.viewModel = ChatsViewModel(chatPartner: chatPartner)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message))
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(chatPartner.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
