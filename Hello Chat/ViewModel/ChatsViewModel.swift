//
//  ChatsViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import Firebase

class ChatsViewModel: ObservableObject {
    @Published var messages = [Message]()
    let chatPartner: User
    
    init(chatPartner: User) {
        self.chatPartner = chatPartner
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        guard let chatPartnerId = chatPartner.id else { return }
        
        let query = COLLECTION_MESSAGES
            .document(currentUserId)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.messages =  documents.compactMap{ try? $0.data(as: Message.self) }
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        guard let chatPartnerId = chatPartner.id else { return }
        
        let currentUserRef =
            COLLECTION_MESSAGES.document(currentUserId).collection(chatPartnerId).document()
        let chatPartnerRef =
            COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUserId)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "fromId": currentUserId,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "text": messageText,
                                   "profileImageUrl": AuthViewModel.shared.currentUser?.profileImageUrl ?? ""]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        
    }
}

