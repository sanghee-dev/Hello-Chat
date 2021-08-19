//
//  ChannelChatViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import Foundation

class ChannelChatViewModel: ObservableObject {
    let channel: Channel
    @Published var messages = [Message]()
    
    init(_ channel: Channel) {
        self.channel = channel
        fetchChannelMessages()
    }
    
    func fetchChannelMessages() {
        
    }
    
    func sendChannelMessage(_ message: String) {
        print(message)
    }
}
