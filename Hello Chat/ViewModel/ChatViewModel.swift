//
//  ChatViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import Firebase

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef =
            COLLECTION_MESSAGES.document(currentUserId).collection(chatPartnerId).document()
        let chatPartnerRef =
            COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUserId)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "fromId": currentUserId,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "text": messageText]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        
    }
}
