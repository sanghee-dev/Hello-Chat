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
    
    @Namespace var topID
    @Namespace var bottomID
    
    init(chatPartner: User) {
        self.chatPartner = chatPartner
        self.viewModel = ChatsViewModel(chatPartner: chatPartner)
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    Button(
                        action: { withAnimation { proxy.scrollTo(bottomID) } },
                        label: { Image(systemName: "chevron.down").foregroundColor(Color(.systemGray2)) })
                        .id(topID)
                    
                    VStack(spacing: 16) {
                        ForEach(viewModel.messages) { message in
                            MessageView(viewModel: MessageViewModel(message))
                        }
                    }
                    .onChange(of: messageText == "") { _ in
                        withAnimation { proxy.scrollTo(bottomID) }
                    }
                    
                    Text("").id(bottomID)
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
