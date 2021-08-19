//
//  ChannelChatViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import Firebase

class ChannelChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    let channel: Channel
    
    init(_ channel: Channel) {
        self.channel = channel
        fetchChannelMessages()
    }
    
    func fetchChannelMessages() {
        
    }
    
    func sendChannelMessage(_ messageText: String) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = currentUser.id else { return }
        guard let channelId = channel.id else { return }
  
        let data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "fromId": currentUid,
                                   "toId": channelId,
                                   "read": false,
                                   "text": messageText,
                                   "profileImageUrl": currentUser.profileImageUrl ]
        
        COLLECTION_CHANNELS.document(channelId)
            .collection("messages").document().setData(data)
        
        let lastMessage = "\(currentUser.username): \(messageText)"
        COLLECTION_CHANNELS.document(channelId).updateData(["lastMessage": lastMessage])
    }
}
