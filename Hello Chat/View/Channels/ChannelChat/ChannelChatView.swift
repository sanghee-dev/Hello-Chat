//
//  ChannelChatView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import SwiftUI

struct ChannelChatView: View {
    @ObservedObject var viewModel: ChannelChatViewModel
    @Environment(\.presentationMode) var mode
    @State private var messageText = ""
    @State private var showSheet = false
    
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
                                        
                    VStack(spacing: 8) {
                        ForEach(viewModel.messages) { message in
                            MessageView(viewModel: MessageViewModel(message),
                                        config: .groupMessage)
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
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
        .padding(.vertical)
        .navigationTitle("\(viewModel.channel.name)(\(viewModel.channel.uids.count))")
        .navigationBarItems(trailing: ExitButton)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var ExitButton: some View {
        Button (action: { self.showSheet = true },
                label: { Text("Edit").foregroundColor(Color(.systemGray)) })
            .alert(isPresented: $showSheet) {
                Alert(title: Text("Exit"),
                      message: Text("Are you sure you want to exit channel?"),
                      primaryButton: .destructive(Text("Exit"), action: {
                        viewModel.exitChannel()
                        mode.wrappedValue.dismiss()
                      }),
                      secondaryButton: .cancel() )
            }
    }
    
    func sendMessage() {
        viewModel.sendChannelMessage(messageText)
        messageText = ""
    }
}
