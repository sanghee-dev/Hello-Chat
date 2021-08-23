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
    @Published var showingErrorAlert = false
    @Published var errorMessage = ""
    
    init(chatPartner: User) {
        self.chatPartner = chatPartner
        fetchMessages()
    }
    
    func showErrorMessage(_ errorMessage: String) {
        self.showingErrorAlert = true
        self.errorMessage = errorMessage
    }
    
    func fetchMessages() {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        guard let chatPartnerId = chatPartner.id else { return }
        
        let query = COLLECTION_MESSAGES
            .document(currentUserId)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, error in
            if let (errorMessage) = error?.localizedDescription {
                self.showErrorMessage(errorMessage)
                return
            }
            
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let addedMessages = changes.compactMap{ try? $0.document.data(as: Message.self) }
            self.messages.append(contentsOf: addedMessages)
        }
        
        query.getDocuments { snapshot, error in
            if let (errorMessage) = error?.localizedDescription {
                self.showErrorMessage(errorMessage)
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            self.messages = documents.compactMap{ try? $0.data(as: Message.self) }
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        guard let chatPartnerId = chatPartner.id else { return }
        
        // save at messages
        let currentUserRef =
            COLLECTION_MESSAGES.document(currentUserId).collection(chatPartnerId).document()
        let chatPartnerRef =
            COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUserId)
        
        // save at recent-messages
        let recentCurrentUserRef =
            COLLECTION_MESSAGES.document(currentUserId).collection("recent-messages").document(chatPartnerId)
        let recentChatPartnerRef =
            COLLECTION_MESSAGES.document(chatPartnerId).collection("recent-messages").document(currentUserId)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": AuthViewModel.shared.currentUser?.username ?? "",
                                   "fromId": currentUserId,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "text": messageText,
                                   "profileImageUrl": AuthViewModel.shared.currentUser?.profileImageUrl ?? ""]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        
        recentCurrentUserRef.setData(data)
        recentChatPartnerRef.setData(data)
    }
}
