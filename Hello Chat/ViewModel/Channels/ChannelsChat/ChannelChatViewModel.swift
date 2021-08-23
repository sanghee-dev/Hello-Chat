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
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    
    init(_ channel: Channel) {
        self.channel = channel
        fetchChannelMessages()
    }
    
    func exitChannel() {
        guard let channelId = channel.id else { return }
        let currentUid = AuthViewModel.shared.currentUser?.id ?? ""
        
        let filteredUids = filterUids(channelId: channelId, currentUid: currentUid)
        let data: [String: Any] = ["uids": filteredUids]
        
        updateChannel(channelId: channelId, data: data)
    }
    
    func filterUids(channelId: String, currentUid: String) -> [String] {
        var filteredUids: [String] = []
        
        COLLECTION_CHANNELS.document(channelId).getDocument { snapshot, error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let channel = try? snapshot?.data(as: Channel.self) else { return }
            filteredUids = channel.uids.filter({ $0 != "\(AuthViewModel.shared.currentUser?.id ?? "")" })
        }
        return filteredUids
    }
    
    func updateChannel(channelId: String, data: [String: Any]) {
        COLLECTION_CHANNELS.document(channelId).updateData(data) { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
        }
    }
    
    func fetchChannelMessages() {
        guard let channelId = channel.id else { return }
        
        let query = COLLECTION_CHANNELS.document(channelId)
            .collection("messages")
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let addedMessages = changes.compactMap{ try? $0.document.data(as: Message.self) }
            self.messages.append(contentsOf: addedMessages)
        }
        
        query.getDocuments { snapshot, error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            self.messages = documents.compactMap{ try? $0.data(as: Message.self) }
        }
    }
    
    func sendChannelMessage(_ messageText: String) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = currentUser.id else { return }
        guard let channelId = channel.id else { return }
  
        let data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": currentUser.username,
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
