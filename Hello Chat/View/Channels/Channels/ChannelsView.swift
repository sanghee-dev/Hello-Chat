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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(0...5, id: \.self) { _ in
                        ChannelCell()
                    }
                }
            }
            
            FloatingButton(show: $showCreateGroupView)
                .sheet(isPresented: $showCreateGroupView, content: {
                    SelectGroupMembersView(show: $showCreateGroupView)
                })
        }
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView()
    }
}
