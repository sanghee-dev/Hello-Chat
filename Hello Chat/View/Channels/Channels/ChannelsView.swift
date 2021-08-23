//
//  ChannelsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct ChannelsView: View {
    @ObservedObject var viewModel = ChannelsViewModel()
    @State private var showCreateGroupView = false
    @State private var selectedUsers: [User]?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(viewModel.channels) { channel in
                        ChannelCell(channel: channel)
                    }
                }
            }
            
            FloatingButton(show: $showCreateGroupView)
                .sheet(isPresented: $showCreateGroupView, content: {
                    SelectGroupMembersView(show: $showCreateGroupView)
                })
        }
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView()
    }
}
