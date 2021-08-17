//
//  SelectGroupMembersViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/17.
//

import Firebase

class SelectGroupMembersViewModel: ObservableObject {
    @Published var selectableUsers = [SelectableUser]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let users = documents
                .compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != AuthViewModel.shared.currentUser?.id })
            
            self.selectableUsers = users.map({ SelectableUser(user: $0) })
        }
    }
    
    // select or deselect users
    
    // filter users for search with pagination
    
}

