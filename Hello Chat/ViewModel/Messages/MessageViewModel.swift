//
//  MessageViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/06.
//

import Foundation

class MessageViewModel: ObservableObject {
    @Published var chatPartner: User?
    let message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var currentUserId: String {
        return AuthViewModel.shared.currentUser?.id ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUserId
    }
    
    var profileImageUrl: URL? {
        return URL(string: message.profileImageUrl)
    }
    
    var chatPartnerId: String {
        return message.fromId == currentUserId ? message.toId : message.fromId
    }
    
    var chatPartnerUsername: String {
        guard let chatPartner = chatPartner else { return "" }
        return chatPartner.username
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let chatPartner = chatPartner else { return nil }
        return URL(string: chatPartner.profileImageUrl)
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, error in
            self.chatPartner = try? snapshot?.data(as: User.self)
        }
    }
}


