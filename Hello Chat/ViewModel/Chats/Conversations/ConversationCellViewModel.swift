//
//  ConversationCellViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/06.
//

import Foundation

class ConversationCellViewModel: ObservableObject {
    @Published var message: Message
    @Published var chatPartner: User?
    @Published var showErrorAlert = false
    @Published var errorMessage = ""

    init(_ message: Message) {
        self.message = message
        fetchChatPartner()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.currentUser?.id ? message.toId : message.fromId
    }
    
    var chatPartnerUsername: String {
        guard let chatPartner = chatPartner else { return "" }
        return chatPartner.username
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let chatPartner = chatPartner else { return nil }
        return URL(string: chatPartner.profileImageUrl)
    }
    
    func fetchChatPartner() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            self.chatPartner = try? snapshot?.data(as: User.self)
        }
    }
}
