//
//  Message.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let timestamp: Timestamp
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    
    var user: User?
}
