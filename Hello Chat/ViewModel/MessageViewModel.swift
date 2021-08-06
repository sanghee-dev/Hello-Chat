//
//  MessageViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/06.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUserId: String {
        return AuthViewModel.shared.currentUser?.id ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUserId
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
}

