//
//  ChannelsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct ChannelsView: View {
    @State private var showCreateGroupView = false
    @State private var selectedUsers: [User]?

    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let chatPartners = selectedUsers {
                NavigationLink(
                    destination: Text("ConversationView"),
                    isActive: $showCreateGroupView,
                    label: {})
            }
            
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(viewModel.recentMessages) { message in
                        ChannelCell(viewModel: ConversationCellViewModel(message))
                    }
                }
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    showCreateGroupView.toggle()
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .padding(.all, 14)
                })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $showCreateGroupView, content: {
                    Text("Create group view...")
                })
            }
        }
        .onAppear{ viewModel.fetchRecentMessages() }
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView()
    }
}
