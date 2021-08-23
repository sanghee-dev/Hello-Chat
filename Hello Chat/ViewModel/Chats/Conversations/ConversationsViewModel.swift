//
//  ConversationsViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/06.
//

import Foundation
import Firebase

class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    @Published var error: Error?
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        
        let query = COLLECTION_MESSAGES.document(currentUserId)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, error in
            if let error = error {
                self.error = error
            }
            
            guard let documents = snapshot?.documents else { return }
            self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self) })
        }
        
    }
}
