//
//  ChatsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ChatsView: View {
    @ObservedObject var viewModel: ChatsViewModel
    @State private var messageText = ""
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
                    
                    VStack(spacing: 8) {
                        ForEach(viewModel.messages) { message in
                            MessageView(viewModel: MessageViewModel(message),
                                        config: .privateMessage)
                        }
                    }
                    .onChange(of: messageText == "") { _ in
                        withAnimation { proxy.scrollTo(bottomID) }
                    }
                    
                    HStack {}.id(bottomID)
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .padding(.vertical)
        .navigationTitle(chatPartner.username)
        .navigationBarTitleDisplayMode(.inline)
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
