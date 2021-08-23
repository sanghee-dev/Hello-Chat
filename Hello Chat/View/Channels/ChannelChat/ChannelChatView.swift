//
//  ChannelChatView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import SwiftUI

struct ChannelChatView: View {
    @ObservedObject var viewModel: ChannelChatViewModel
    @State private var messageText = ""
    
    @Namespace var topID
    @Namespace var bottomID
    
    init(_ channel: Channel) {
        self.viewModel = ChannelChatViewModel(channel)
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
                            MessageView(viewModel: MessageViewModel(message),
                                        config: .groupMessage)
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
        .navigationTitle(viewModel.channel.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
        .modifier(ErrorAlertModifier(showAlert: $viewModel.showErrorAlert,
                                             message: viewModel.errorMessage))
    }
    
    func sendMessage() {
        viewModel.sendChannelMessage(messageText)
        messageText = ""
    }
}
