//
//  MessageView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ChatPartnersView: View {
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = ChatPartnersViewModel()
    @Binding var showConversationView: Bool
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    
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
                            ChatPartnerCell(user: user)
                        })
                    }
                }
            }
        }
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
    }
}
