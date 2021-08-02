//
//  Message.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import Foundation

struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
