//
//  MainTabView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                ChatsView()
                    .tabItem { Image(systemName: "bubble.left") }
                
                ChannelsView()
                    .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                
                SettingsView()
                    .tabItem { Image(systemName: "gear") }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
