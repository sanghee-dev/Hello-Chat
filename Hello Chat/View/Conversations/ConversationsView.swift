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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(
                destination: ChatsView(),
                isActive: $showConversationView,
                label: {})
            
            ScrollView {
                VStack(spacing: 1) {
                    ForEach((0...5), id: \.self) { _ in
                        NavigationLink(
                            destination:
                                ChatsView(),
                            label: {
                                ConversationCell(imageName: "profile", userName: "Sanghee", conversation: "Hello")
                            })
                    }
                }
            }
            
            Button(action: {
                showMessageView.toggle()
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
            .sheet(isPresented: $showMessageView, content: {
                NewMessageView(showConversationView: $showConversationView)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}