//
//  ChatsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showMessageView = false
    @State private var showConversationView = false
    @State private var selectedUser: User?
    
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let chatPartner = selectedUser {
                NavigationLink(
                    destination: ChatsView(chatPartner: chatPartner),
                    isActive: $showConversationView,
                    label: {})
            }
            
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(viewModel.recentMessages) { message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                    }
                }
            }
            
            FloatingButton(show: $showMessageView)
                .sheet(isPresented: $showMessageView, content: {
                    ChatPartnersView(showConversationView: $showConversationView, user: $selectedUser)
                })            
        }
        .onAppear{ viewModel.fetchRecentMessages() }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
