//
//  MainTabView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return ""
        }
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                ChatsView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem { Image(systemName: "bubble.left") }
                    .tag(0)
                
                ChannelsView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                    .tag(1)
                
                SettingsView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem { Image(systemName: "gear") }
                    .tag(2)
            }
            .navigationTitle(tabTitle)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
