//
//  SelectableUserCellViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/17.
//

import SwiftUI

struct SelectableUserCellViewModel {
    let selectableUser: SelectableUser
    
    var profileImageUrl: URL? {
        return URL(string: selectableUser.user.profileImageUrl)
    }
    
    var username: String {
        return selectableUser.user.username
    }
    
    var statusTitle: String {
        return selectableUser.user.status.title
    }
    
    var buttonSystemName: String {
        return selectableUser.isSelected ? "checkmark.circle.fill" : "circle"
    }
    var buttonForegroundColor: Color {
        return selectableUser.isSelected ? .blue : .gray
    }
    
}
