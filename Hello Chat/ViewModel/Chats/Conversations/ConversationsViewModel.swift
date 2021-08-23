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
    @Published var showingErrorAlert = false
    @Published var errorMessage = ""
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let currentUserId = AuthViewModel.shared.currentUser?.id else { return }
        
        let query = COLLECTION_MESSAGES.document(currentUserId)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, error in
            if let errorMessage = error?.localizedDescription {
                self.showingErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self) })
        }
        
    }
}
