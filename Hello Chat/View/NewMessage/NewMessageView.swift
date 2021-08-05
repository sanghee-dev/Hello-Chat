//
//  MessageView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showConversationView: Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture { isEditing.toggle() }
                    .padding()
                
                VStack(spacing: 1) {
                    ForEach(viewModel.users) { user in
                        Button(action: {
                            showConversationView.toggle()
                            self.user = user
                            mode.wrappedValue.dismiss()
                        }, label: {
                            NewMessageCell(user: user)
                        })
                    }
                }
            }
        }
    }
}
