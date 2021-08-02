//
//  ChatViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "All the colors and personalities"),
            .init(isFromCurrentUser: false, messageText: "You can’t see right through what I truly am"),
            .init(isFromCurrentUser: true, messageText: "You’re hurting me without noticing"),
            .init(isFromCurrentUser: false, messageText: "I’m so, so broke like someone just robbed me"),
            .init(isFromCurrentUser: true, messageText: "I’m no invincible"),
            .init(isFromCurrentUser: false, messageText: "I have much memories of getting more weaker"),
            .init(isFromCurrentUser: true, messageText: "I know I’m not loveable"),
            .init(isFromCurrentUser: false, messageText: "But you know what you’d have to say")
        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
