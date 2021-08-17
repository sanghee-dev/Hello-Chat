//
//  SelectableUser.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/17.
//

import Foundation

struct SelectableUser: Identifiable {
    let user: User
    var isSelected: Bool = false
    
    var id: String {
        return user.id ?? NSUUID().uuidString
    }
}
