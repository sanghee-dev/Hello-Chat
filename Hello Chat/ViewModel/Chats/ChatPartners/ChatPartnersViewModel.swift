//
//  ChatPartnersViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/04.
//

import Foundation
import Firebase

class ChatPartnersViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            self.users = documents
                .compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != AuthViewModel.shared.currentUser?.id })
        }
    }
}

