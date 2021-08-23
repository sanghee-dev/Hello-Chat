//
//  SelectGroupMembersViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/17.
//

import Firebase

class SelectGroupMembersViewModel: ObservableObject {
    @Published var selectableUsers = [SelectableUser]()
    @Published var selectedUsers = [SelectableUser]()
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
            let users = documents
                .compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != AuthViewModel.shared.currentUser?.id })
            
            self.selectableUsers = users.map({ SelectableUser(user: $0) })
        }
    }
    
    func selectUser(_ user: SelectableUser, isSelected: Bool) {
        guard let index = selectableUsers.firstIndex(where: { $0.id == user.id }) else { return }
        
        selectableUsers[index].isSelected = isSelected
        
        if isSelected {
            selectedUsers.append(selectableUsers[index])
        } else {
            selectedUsers.removeAll(where: { $0.id == user.id })
        }
    }
    
    func filteredUsers(_ query: String) -> [SelectableUser] {
        let lowercasedQuery = query.lowercased()
        
        return selectableUsers.filter({
            $0.user.fullname.lowercased().contains(lowercasedQuery) ||
            $0.user.username.lowercased().contains(lowercasedQuery)
        })
    }
}

